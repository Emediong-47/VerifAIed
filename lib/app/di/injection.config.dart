// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:math' as _i407;

import 'package:flutter_tts/flutter_tts.dart' as _i50;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart'
    as _i127;
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart'
    as _i612;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sqflite/sqflite.dart' as _i779;
import 'package:verif_aled/app/di/register_module.dart' as _i540;
import 'package:verif_aled/core/database/app_database.dart' as _i966;
import 'package:verif_aled/core/utils/clock.dart' as _i122;
import 'package:verif_aled/features/auth/application/auth_bloc.dart' as _i416;
import 'package:verif_aled/features/auth/domain/repositories/identity_repository.dart'
    as _i427;
import 'package:verif_aled/features/auth/infrastructure/selfie_store.dart'
    as _i1010;
import 'package:verif_aled/features/auth/infrastructure/sqlite_identity_repository.dart'
    as _i95;
import 'package:verif_aled/features/verification/application/document_capture/document_capture_bloc.dart'
    as _i387;
import 'package:verif_aled/features/verification/application/document_selection/document_selection_bloc.dart'
    as _i46;
import 'package:verif_aled/features/verification/application/document_verification/document_verification_bloc.dart'
    as _i665;
import 'package:verif_aled/features/verification/application/face_verification/face_verification_bloc.dart'
    as _i653;
import 'package:verif_aled/features/verification/application/liveness/liveness_bloc.dart'
    as _i749;
import 'package:verif_aled/features/verification/application/liveness_voice/liveness_voice_bloc.dart'
    as _i246;
import 'package:verif_aled/features/verification/application/personal_details/personal_details_bloc.dart'
    as _i84;
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart'
    as _i34;
import 'package:verif_aled/features/verification/domain/repositories/document_capture_repository.dart'
    as _i940;
import 'package:verif_aled/features/verification/domain/repositories/face_embedding_repository.dart'
    as _i959;
import 'package:verif_aled/features/verification/domain/repositories/face_presence_repository.dart'
    as _i126;
import 'package:verif_aled/features/verification/domain/repositories/face_tracking_repository.dart'
    as _i634;
import 'package:verif_aled/features/verification/domain/repositories/speech_repository.dart'
    as _i874;
import 'package:verif_aled/features/verification/domain/repositories/text_recognition_repository.dart'
    as _i766;
import 'package:verif_aled/features/verification/domain/services/document_text_parser.dart'
    as _i947;
import 'package:verif_aled/features/verification/domain/services/document_verifier.dart'
    as _i914;
import 'package:verif_aled/features/verification/domain/services/face_matcher.dart'
    as _i94;
import 'package:verif_aled/features/verification/domain/services/liveness_challenge_generator.dart'
    as _i162;
import 'package:verif_aled/features/verification/domain/services/liveness_evaluator.dart'
    as _i356;
import 'package:verif_aled/features/verification/infrastructure/camera_face_tracking_repository.dart'
    as _i91;
import 'package:verif_aled/features/verification/infrastructure/capture_store.dart'
    as _i310;
import 'package:verif_aled/features/verification/infrastructure/face_embedder.dart'
    as _i824;
import 'package:verif_aled/features/verification/infrastructure/flutter_tts_speech_repository.dart'
    as _i386;
import 'package:verif_aled/features/verification/infrastructure/image_picker_document_capture_repository.dart'
    as _i783;
import 'package:verif_aled/features/verification/infrastructure/ml_kit_face_embedding_repository.dart'
    as _i301;
import 'package:verif_aled/features/verification/infrastructure/ml_kit_face_presence_repository.dart'
    as _i1053;
import 'package:verif_aled/features/verification/infrastructure/ml_kit_text_recognition_repository.dart'
    as _i559;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i46.DocumentSelectionBloc>(() => _i46.DocumentSelectionBloc());
    gh.lazySingleton<_i183.ImagePicker>(() => registerModule.imagePicker);
    gh.lazySingleton<_i407.Random>(() => registerModule.random);
    gh.lazySingleton<_i50.FlutterTts>(() => registerModule.flutterTts);
    gh.lazySingleton<_i779.DatabaseFactory>(
      () => registerModule.databaseFactory,
    );
    gh.lazySingleton<_i612.TextRecognizer>(
      () => registerModule.textRecognizer,
      dispose: _i540.closeTextRecognizer,
    );
    gh.lazySingleton<_i122.Clock>(() => const _i122.Clock());
    gh.lazySingleton<_i34.VerificationSessionBloc>(
      () => _i34.VerificationSessionBloc(),
    );
    gh.lazySingleton<_i947.DocumentTextParser>(
      () => const _i947.DocumentTextParser(),
    );
    gh.lazySingleton<_i94.FaceMatcher>(() => const _i94.FaceMatcher());
    gh.lazySingleton<_i356.LivenessEvaluator>(
      () => const _i356.LivenessEvaluator(),
    );
    gh.lazySingleton<_i127.FaceDetector>(
      () => registerModule.liveDetector,
      instanceName: 'liveFaceDetector',
      dispose: _i540.closeFaceDetector,
    );
    gh.factory<_i162.LivenessChallengeGenerator>(
      () => _i162.LivenessChallengeGenerator(gh<_i407.Random>()),
    );
    gh.lazySingleton<_i966.AppDatabase>(
      () => _i966.AppDatabase(gh<_i779.DatabaseFactory>()),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i127.FaceDetector>(
      () => registerModule.stillDetector,
      instanceName: 'stillFaceDetector',
      dispose: _i540.closeFaceDetector,
    );
    gh.lazySingleton<_i874.SpeechRepository>(
      () => _i386.FlutterTtsSpeechRepository(gh<_i50.FlutterTts>()),
    );
    gh.lazySingleton<_i824.FaceEmbedder>(
      () => _i824.MobileFaceNetEmbedder(),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i914.DocumentVerifier>(
      () => _i914.DocumentVerifier(gh<_i947.DocumentTextParser>()),
    );
    gh.lazySingleton<_i959.FaceEmbeddingRepository>(
      () => _i301.MlKitFaceEmbeddingRepository(
        gh<_i127.FaceDetector>(instanceName: 'stillFaceDetector'),
        gh<_i824.FaceEmbedder>(),
      ),
    );
    gh.lazySingleton<_i766.TextRecognitionRepository>(
      () => _i559.MlKitTextRecognitionRepository(gh<_i612.TextRecognizer>()),
    );
    gh.factory<_i653.FaceVerificationBloc>(
      () => _i653.FaceVerificationBloc(
        gh<_i959.FaceEmbeddingRepository>(),
        gh<_i94.FaceMatcher>(),
      ),
    );
    gh.lazySingleton<_i126.FacePresenceRepository>(
      () => _i1053.MlKitFacePresenceRepository(
        gh<_i127.FaceDetector>(instanceName: 'stillFaceDetector'),
      ),
    );
    gh.lazySingleton<_i1010.SelfieStore>(
      () => _i1010.SelfieStore(gh<_i122.Clock>()),
    );
    gh.lazySingleton<_i310.CaptureStore>(
      () => _i310.CaptureStore(gh<_i122.Clock>()),
    );
    gh.factory<_i84.PersonalDetailsBloc>(
      () => _i84.PersonalDetailsBloc(gh<_i122.Clock>()),
    );
    gh.lazySingleton<_i940.DocumentCaptureRepository>(
      () => _i783.ImagePickerDocumentCaptureRepository(
        gh<_i183.ImagePicker>(),
        gh<_i310.CaptureStore>(),
      ),
    );
    gh.lazySingleton<_i91.CameraFaceTrackingRepository>(
      () => _i91.CameraFaceTrackingRepository(
        gh<_i127.FaceDetector>(instanceName: 'liveFaceDetector'),
        gh<_i310.CaptureStore>(),
      ),
    );
    gh.lazySingleton<_i246.LivenessVoiceBloc>(
      () => _i246.LivenessVoiceBloc(
        gh<_i874.SpeechRepository>(),
        gh<_i122.Clock>(),
      ),
    );
    gh.factory<_i665.DocumentVerificationBloc>(
      () => _i665.DocumentVerificationBloc(
        gh<_i766.TextRecognitionRepository>(),
        gh<_i126.FacePresenceRepository>(),
        gh<_i914.DocumentVerifier>(),
      ),
    );
    gh.lazySingleton<_i634.FaceTrackingRepository>(
      () => registerModule.faceTrackingRepository(
        gh<_i91.CameraFaceTrackingRepository>(),
      ),
    );
    gh.factory<_i387.DocumentCaptureBloc>(
      () => _i387.DocumentCaptureBloc(gh<_i940.DocumentCaptureRepository>()),
    );
    gh.lazySingleton<_i427.IdentityRepository>(
      () => _i95.SqliteIdentityRepository(
        gh<_i966.AppDatabase>(),
        gh<_i1010.SelfieStore>(),
      ),
    );
    gh.factory<_i749.LivenessBloc>(
      () => _i749.LivenessBloc(
        gh<_i634.FaceTrackingRepository>(),
        gh<_i356.LivenessEvaluator>(),
        gh<_i162.LivenessChallengeGenerator>(),
      ),
    );
    gh.lazySingleton<_i416.AuthBloc>(
      () => _i416.AuthBloc(gh<_i427.IdentityRepository>(), gh<_i122.Clock>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i540.RegisterModule {}
