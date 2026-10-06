import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:verif_aled/features/verification/domain/objects/face_observation_object.dart';
import 'package:verif_aled/features/verification/infrastructure/camera_face_tracking_repository.dart';

void main() {
  Face face({
    Rect box = Rect.zero,
    double? eulerX,
    double? eulerY,
    double? smilingProbability,
    int? trackingId,
  }) => Face(
    boundingBox: box,
    landmarks: const {},
    contours: const {},
    headEulerAngleX: eulerX,
    headEulerAngleY: eulerY,
    smilingProbability: smilingProbability,
    trackingId: trackingId,
  );

  test('maps ML Kit angles, smile and tracking id to an observation', () {
    // Arrange
    final detected = face(
      eulerX: -8,
      eulerY: 30,
      smilingProbability: 0.9,
      trackingId: 4,
    );

    // Act
    final observation = CameraFaceTrackingRepository.toObservation(detected);

    // Assert
    expect(
      observation,
      const FaceObservation(
        yaw: 30,
        pitch: -8,
        smilingProbability: 0.9,
        trackingId: 4,
      ),
    );
  });

  test('missing angles are treated as facing forward', () {
    // Arrange
    final detected = face();

    // Act
    final observation = CameraFaceTrackingRepository.toObservation(detected);

    // Assert
    expect(observation, const FaceObservation(yaw: 0, pitch: 0));
  });

  test('measures the face position against the upright frame', () {
    // Arrange
    final detected = face(box: const Rect.fromLTWH(120, 240, 240, 300));

    // Act
    final observation = CameraFaceTrackingRepository.toObservation(
      detected,
      frameSize: const Size(480, 640),
    );

    // Assert
    expect(observation.centerX, 0.5);
    expect(observation.centerY, 0.609375);
    expect(observation.faceWidth, 0.5);
  });

  test('leaves the position unknown without a frame size', () {
    // Arrange
    final detected = face(box: const Rect.fromLTWH(120, 240, 240, 300));

    // Act
    final observation = CameraFaceTrackingRepository.toObservation(detected);

    // Assert
    expect(observation.centerX, isNull);
    expect(observation.faceWidth, isNull);
  });

  final rotations = {
    InputImageRotation.rotation0deg: const Size(640, 480),
    InputImageRotation.rotation90deg: const Size(480, 640),
    InputImageRotation.rotation180deg: const Size(640, 480),
    InputImageRotation.rotation270deg: const Size(480, 640),
  };

  for (final MapEntry(key: rotation, value: expected) in rotations.entries) {
    test(
      'a ${rotation.name} sensor frame is ${expected.width}x${expected.height} upright',
      () {
        // Arrange
        final metadata = InputImageMetadata(
          size: const Size(640, 480),
          rotation: rotation,
          format: InputImageFormat.nv21,
          bytesPerRow: 640,
        );

        // Act
        final size = CameraFaceTrackingRepository.uprightSize(metadata);

        // Assert
        expect(size, expected);
      },
    );
  }
}
