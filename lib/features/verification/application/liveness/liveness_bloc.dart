import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_observation_object.dart';
import 'package:verif_aled/features/verification/domain/objects/liveness_check_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/face_tracking_repository.dart';
import 'package:verif_aled/features/verification/domain/services/liveness_challenge_generator.dart';
import 'package:verif_aled/features/verification/domain/services/liveness_evaluator.dart';

part 'liveness_event.dart';
part 'liveness_state.dart';
part 'liveness_bloc.freezed.dart';

@injectable
class LivenessBloc extends Bloc<LivenessEvent, LivenessState> {
  LivenessBloc(this._repository, this._evaluator, this._generator)
    : super(const LivenessState()) {
    on<LivenessStarted>(_onStarted);
    on<FacesDetected>(_onFacesDetected);
  }

  final FaceTrackingRepository _repository;
  final LivenessEvaluator _evaluator;
  final LivenessChallengeGenerator _generator;

  StreamSubscription<List<FaceObservation>>? _subscription;

  Future<void> _onStarted(
    LivenessStarted event,
    Emitter<LivenessState> emit,
  ) async {
    await _subscription?.cancel();
    emit(const LivenessState(status: LivenessStatus.starting));

    final result = await _repository.start();
    if (result case Err(:final failure)) {
      emit(state.copyWith(status: LivenessStatus.failure, failure: failure));
      return;
    }

    emit(
      LivenessState(
        status: LivenessStatus.inProgress,
        check: LivenessCheck(challenges: _generator.generate()),
      ),
    );
    _subscription = _repository.faces.listen(
      (faces) => add(LivenessEvent.facesDetected(faces)),
    );
  }

  Future<void> _onFacesDetected(
    FacesDetected event,
    Emitter<LivenessState> emit,
  ) async {
    final holdingStill = state.status == LivenessStatus.holdingStill;
    if (state.status != LivenessStatus.inProgress && !holdingStill) return;
    final check = state.check!;

    if (event.faces.length != 1) {
      emit(
        state.copyWith(
          matchingFrames: 0,
          guidance: event.faces.isEmpty
              ? FaceGuidance.noFace
              : FaceGuidance.multipleFaces,
        ),
      );
      return;
    }

    final face = event.faces.single;
    // A different face mid-check could be someone swapping in a photo.
    if (state.trackingId != null &&
        face.trackingId != null &&
        face.trackingId != state.trackingId) {
      emit(
        state.copyWith(
          status: LivenessStatus.inProgress,
          check: check.restart(),
          trackingId: face.trackingId,
          matchingFrames: 0,
          guidance: FaceGuidance.faceChanged,
        ),
      );
      return;
    }

    final trackingId = face.trackingId ?? state.trackingId;
    if (holdingStill) {
      await _holdStill(face, trackingId, emit);
    } else {
      _performChallenge(face, check, trackingId, emit);
    }
  }

  void _performChallenge(
    FaceObservation face,
    LivenessCheck check,
    int? trackingId,
    Emitter<LivenessState> emit,
  ) {
    if (!_evaluator.isPerforming(check.currentChallenge!, face)) {
      emit(
        state.copyWith(
          trackingId: trackingId,
          matchingFrames: 0,
          guidance: FaceGuidance.none,
        ),
      );
      return;
    }

    final matchingFrames = state.matchingFrames + 1;
    if (matchingFrames < LivenessEvaluator.requiredFrames) {
      emit(
        state.copyWith(
          trackingId: trackingId,
          matchingFrames: matchingFrames,
          guidance: FaceGuidance.none,
        ),
      );
      return;
    }

    final next = check.complete();
    emit(
      state.copyWith(
        check: next,
        trackingId: trackingId,
        matchingFrames: 0,
        guidance: FaceGuidance.none,
        status: next.isComplete
            ? LivenessStatus.holdingStill
            : LivenessStatus.inProgress,
      ),
    );
  }

  Future<void> _holdStill(
    FaceObservation face,
    int? trackingId,
    Emitter<LivenessState> emit,
  ) async {
    final guidance = switch (_evaluator.position(face)) {
      FacePosition.good => FaceGuidance.none,
      FacePosition.turned => FaceGuidance.faceCamera,
      FacePosition.tooFar => FaceGuidance.moveCloser,
      FacePosition.tooClose => FaceGuidance.moveBack,
      FacePosition.offCentre => FaceGuidance.centreFace,
    };
    final matchingFrames = guidance == FaceGuidance.none
        ? state.matchingFrames + 1
        : 0;

    if (matchingFrames < LivenessEvaluator.requiredStillFrames) {
      emit(
        state.copyWith(
          trackingId: trackingId,
          matchingFrames: matchingFrames,
          guidance: guidance,
        ),
      );
      return;
    }

    await _subscription?.cancel();
    _subscription = null;
    emit(
      state.copyWith(
        trackingId: trackingId,
        matchingFrames: matchingFrames,
        guidance: FaceGuidance.none,
        status: LivenessStatus.capturing,
      ),
    );

    final selfie = await _repository.captureSelfie();
    emit(switch (selfie) {
      Ok(:final value) => state.copyWith(
        status: LivenessStatus.completed,
        selfie: value,
      ),
      Err(:final failure) => state.copyWith(
        status: LivenessStatus.failure,
        failure: failure,
      ),
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await _repository.stop();
    return super.close();
  }
}
