import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:verif_aled/app/di/injection.dart';
import 'package:verif_aled/core/widgets/status_colors.dart';
import 'package:verif_aled/features/verification/infrastructure/camera_face_tracking_repository.dart';

/// The front camera inside an oval face guide.
class LivenessCameraPreview extends StatelessWidget {
  const LivenessCameraPreview({super.key, required this.holdingPose});

  /// Turns the guide green while the user is holding the requested pose.
  final bool holdingPose;

  static const _width = 250.0;
  static const _height = 330.0;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final controller = getIt<CameraFaceTrackingRepository>().controller;
    final ready = controller != null && controller.value.isInitialized;
    // The camera reports its size in landscape; the guide is portrait.
    final previewSize = ready
        ? controller.value.previewSize ?? const Size(640, 480)
        : null;

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _width,
        height: _height,
        padding: const EdgeInsets.all(5),
        decoration: ShapeDecoration(
          shape: OvalBorder(
            side: BorderSide(
              width: 5,
              color: holdingPose
                  ? StatusColors.of(context).success
                  : scheme.primary,
            ),
          ),
        ),
        child: ClipOval(
          child: previewSize == null
              ? ColoredBox(
                  color: scheme.surfaceContainerHighest,
                  child: const Center(child: CircularProgressIndicator()),
                )
              : FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: previewSize.height,
                    height: previewSize.width,
                    child: CameraPreview(controller!),
                  ),
                ),
        ),
      ),
    );
  }
}
