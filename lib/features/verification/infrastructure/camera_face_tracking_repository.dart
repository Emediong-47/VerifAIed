import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_observation_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/face_tracking_repository.dart';
import 'package:verif_aled/features/verification/infrastructure/capture_store.dart';
import 'package:verif_aled/features/verification/infrastructure/face_detectors.dart';

/// Streams ML Kit face detections from the front camera.
///
/// Registered as itself so the liveness preview can reach [controller].
@lazySingleton
class CameraFaceTrackingRepository implements FaceTrackingRepository {
  CameraFaceTrackingRepository(
    @Named(liveFaceDetector) this._detector,
    this._captures,
  );

  final FaceDetector _detector;
  final CaptureStore _captures;
  final _faces = StreamController<List<FaceObservation>>.broadcast();

  CameraController? _controller;
  bool _isProcessingFrame = false;

  static const _orientationDegrees = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  CameraController? get controller => _controller;

  @override
  Stream<List<FaceObservation>> get faces => _faces.stream;

  @override
  Future<Result<void>> start() async {
    await stop();
    try {
      final cameras = await availableCameras();
      final front = cameras
          .where((c) => c.lensDirection == CameraLensDirection.front)
          .firstOrNull;
      if (front == null) return const Err(CameraFailure('No front camera'));

      final controller = CameraController(
        front,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid
            ? ImageFormatGroup.nv21
            : ImageFormatGroup.bgra8888,
      );
      await controller.initialize();
      _controller = controller;
      await controller.startImageStream(_onFrame);
      return const Ok(null);
    } on CameraException catch (e) {
      return Err(CameraFailure(e.description ?? e.code));
    }
  }

  @override
  Future<Result<DocumentImage>> captureSelfie() async {
    final controller = _controller;
    if (controller == null) {
      return const Err(CameraFailure('Camera is not running'));
    }
    try {
      if (controller.value.isStreamingImages) {
        await controller.stopImageStream();
      }
      final file = await controller.takePicture();
      return Ok(
        await _captures.keep(
          DocumentImage(path: file.path),
          CaptureKind.selfie,
        ),
      );
    } on CameraException catch (e) {
      return Err(CameraFailure(e.description ?? e.code));
    } on FileSystemException catch (e) {
      return Err(CameraFailure('Could not store the selfie: ${e.message}'));
    }
  }

  @override
  Future<void> stop() async {
    final controller = _controller;
    _controller = null;
    if (controller == null) return;
    if (controller.value.isStreamingImages) {
      await controller.stopImageStream();
    }
    await controller.dispose();
  }

  /// ML Kit reports a positive Euler Y when the face turns towards the right
  /// of the image. Front camera frames are not mirrored, so that is the
  /// user's left.
  ///
  /// [frameSize] is the upright frame the bounding box is measured in; the
  /// face's position is left unknown without it.
  static FaceObservation toObservation(Face face, {Size? frameSize}) {
    final box = face.boundingBox;
    return FaceObservation(
      yaw: face.headEulerAngleY ?? 0,
      pitch: face.headEulerAngleX ?? 0,
      smilingProbability: face.smilingProbability,
      trackingId: face.trackingId,
      centerX: frameSize == null ? null : box.center.dx / frameSize.width,
      centerY: frameSize == null ? null : box.center.dy / frameSize.height,
      faceWidth: frameSize == null ? null : box.width / frameSize.width,
    );
  }

  /// ML Kit measures faces in the frame after rotation, so a sideways
  /// sensor swaps width and height.
  static Size uprightSize(InputImageMetadata metadata) =>
      switch (metadata.rotation) {
        InputImageRotation.rotation90deg ||
        InputImageRotation.rotation270deg => metadata.size.flipped,
        _ => metadata.size,
      };

  Future<void> _onFrame(CameraImage image) async {
    // Drop frames while the detector is busy rather than queueing them.
    if (_isProcessingFrame) return;
    final input = _toInputImage(image);
    if (input == null) return;

    _isProcessingFrame = true;
    try {
      final faces = await _detector.processImage(input);
      final frameSize = uprightSize(input.metadata!);
      _faces.add([
        for (final face in faces) toObservation(face, frameSize: frameSize),
      ]);
    } catch (_) {
      // A frame that fails detection is skipped; the next one is tried.
    } finally {
      _isProcessingFrame = false;
    }
  }

  InputImage? _toInputImage(CameraImage image) {
    final controller = _controller;
    if (controller == null) return null;

    final sensorOrientation = controller.description.sensorOrientation;
    final InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else {
      final deviceDegrees =
          _orientationDegrees[controller.value.deviceOrientation];
      if (deviceDegrees == null) return null;
      // Front camera: compensate for the sensor and device rotation.
      rotation = InputImageRotationValue.fromRawValue(
        (sensorOrientation + deviceDegrees) % 360,
      );
    }
    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    final supported = Platform.isAndroid
        ? format == InputImageFormat.nv21
        : format == InputImageFormat.bgra8888;
    if (format == null || !supported || image.planes.length != 1) return null;

    final plane = image.planes.single;
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }
}
