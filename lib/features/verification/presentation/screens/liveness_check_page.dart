import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/di/injection.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/core/widgets/app_animation.dart';
import 'package:verif_aled/core/widgets/flow_scaffold.dart';
import 'package:verif_aled/core/widgets/message_banner.dart';
import 'package:verif_aled/features/verification/application/liveness/liveness_bloc.dart';
import 'package:verif_aled/features/verification/application/liveness_voice/liveness_voice_bloc.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';
import 'package:verif_aled/features/verification/domain/services/liveness_evaluator.dart';
import 'package:verif_aled/features/verification/presentation/widgets/liveness_action_ui.dart';
import 'package:verif_aled/features/verification/presentation/widgets/liveness_camera_preview.dart';
import 'package:verif_aled/features/verification/presentation/widgets/liveness_stepper_widget.dart';

@RoutePage()
class LivenessCheckPage extends StatelessWidget {
  const LivenessCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<LivenessBloc>()..add(const LivenessEvent.started()),
        ),
        BlocProvider.value(value: getIt<LivenessVoiceBloc>()),
      ],
      child: BlocListener<LivenessBloc, LivenessState>(
        // Every change goes to the voice guide, which decides what to say.
        listener: (context, state) => context.read<LivenessVoiceBloc>().add(
          LivenessVoiceEvent.livenessChanged(state),
        ),
        child: BlocConsumer<LivenessBloc, LivenessState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.status == LivenessStatus.completed,
          listener: (context, state) async {
            final bloc = context.read<LivenessBloc>();
            context.read<VerificationSessionBloc>().add(
              VerificationSessionEvent.livenessPassed(state.selfie!),
            );
            await context.router.push(const FaceVerificationRoute());
            // Coming back here means the user wants to retake the selfie.
            if (!bloc.isClosed) bloc.add(const LivenessEvent.started());
          },
          builder: (context, state) {
            if (state.status == LivenessStatus.failure) {
              return FlowScaffold(
                title: 'Liveness Check',
                step: 4,
                appBarActions: const [_MuteButton()],
                actions: [
                  FilledButton.icon(
                    onPressed: () => context.read<LivenessBloc>().add(
                      const LivenessEvent.started(),
                    ),
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Try again'),
                  ),
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: AppAnimation(
                        AppAnimations.failure,
                        semanticLabel: 'Liveness check failed',
                      ),
                    ),
                    const SizedBox(height: 16),
                    MessageBanner(
                      message:
                          state.failure?.message ?? 'Liveness check failed',
                    ),
                  ],
                ),
              );
            }

            final check = state.check;
            final cameraVisible = switch (state.status) {
              LivenessStatus.inProgress ||
              LivenessStatus.holdingStill ||
              LivenessStatus.capturing => true,
              _ => false,
            };

            return FlowScaffold(
              title: 'Liveness Check',
              step: 4,
              appBarActions: const [_MuteButton()],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (check != null) LivenessStepperWidget(check: check),
                  const SizedBox(height: 24),
                  if (cameraVisible)
                    LivenessCameraPreview(holdingPose: state.matchingFrames > 0)
                  else
                    const SizedBox(
                      height: 330,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  const SizedBox(height: 24),
                  _Instruction(state: state),
                  if (state.status == LivenessStatus.holdingStill) ...[
                    const SizedBox(height: 16),
                    _HoldProgress(matchingFrames: state.matchingFrames),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Instruction extends StatelessWidget {
  const _Instruction({required this.state});

  final LivenessState state;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final action = state.check?.currentChallenge;
    final (icon, text) = switch (state.status) {
      LivenessStatus.initial || LivenessStatus.starting => (
        Icons.photo_camera_front_outlined,
        'Starting camera…',
      ),
      LivenessStatus.capturing ||
      LivenessStatus.completed => (Icons.photo_camera_outlined, 'Capturing…'),
      LivenessStatus.failure => (
        Icons.error_outline_rounded,
        'Liveness check failed',
      ),
      LivenessStatus.inProgress ||
      LivenessStatus.holdingStill => switch (state.guidance) {
        FaceGuidance.noFace => (
          Icons.face_outlined,
          'Position your face in the frame',
        ),
        FaceGuidance.multipleFaces => (
          Icons.groups_outlined,
          'Only one face should be visible',
        ),
        FaceGuidance.faceChanged => (
          Icons.restart_alt_rounded,
          'Face changed, starting again',
        ),
        FaceGuidance.faceCamera => (
          Icons.center_focus_strong_rounded,
          'Face the camera',
        ),
        FaceGuidance.moveCloser => (Icons.zoom_in_rounded, 'Move closer'),
        FaceGuidance.moveBack => (Icons.zoom_out_rounded, 'Move back'),
        FaceGuidance.centreFace => (
          Icons.filter_center_focus_rounded,
          'Centre your face',
        ),
        FaceGuidance.none when state.status == LivenessStatus.holdingStill => (
          Icons.center_focus_strong_rounded,
          'Hold still',
        ),
        FaceGuidance.none => (
          action?.icon ?? Icons.face_outlined,
          action?.label ?? '',
        ),
      },
    };

    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Container(
          key: ValueKey(text),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: scheme.primaryContainer,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: scheme.onPrimaryContainer),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: scheme.onPrimaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Fills up while the user holds still, until the selfie is taken.
class _HoldProgress extends StatelessWidget {
  const _HoldProgress({required this.matchingFrames});

  final int matchingFrames;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Semantics(
        label: 'Holding still',
        child: LinearProgressIndicator(
          value: matchingFrames / LivenessEvaluator.requiredStillFrames,
          minHeight: 8,
        ),
      ),
    );
  }
}

/// Turns the spoken instructions on or off.
class _MuteButton extends StatelessWidget {
  const _MuteButton();

  @override
  Widget build(BuildContext context) {
    final muted = context.select((LivenessVoiceBloc bloc) => bloc.state.muted);

    return IconButton(
      icon: Icon(muted ? Icons.volume_off_rounded : Icons.volume_up_rounded),
      tooltip: muted ? 'Unmute voice guidance' : 'Mute voice guidance',
      onPressed: () => context.read<LivenessVoiceBloc>().add(
        const LivenessVoiceEvent.muteToggled(),
      ),
    );
  }
}
