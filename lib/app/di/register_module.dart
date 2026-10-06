import 'dart:math';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:verif_aled/features/verification/domain/repositories/face_tracking_repository.dart';
import 'package:verif_aled/features/verification/infrastructure/camera_face_tracking_repository.dart';
import 'package:verif_aled/features/verification/infrastructure/face_detectors.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @lazySingleton
  Random get random => Random.secure();

  @lazySingleton
  FlutterTts get flutterTts => FlutterTts();

  @lazySingleton
  sqflite.DatabaseFactory get databaseFactory => sqflite.databaseFactory;

  @LazySingleton(dispose: closeTextRecognizer)
  TextRecognizer get textRecognizer =>
      TextRecognizer(script: TextRecognitionScript.latin);

  // Accurate mode is required for a reliable head-turn (Euler Y) angle.
  @Named(liveFaceDetector)
  @LazySingleton(dispose: closeFaceDetector)
  FaceDetector get liveDetector => FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true,
      enableTracking: true,
      minFaceSize: 0.3,
      performanceMode: FaceDetectorMode.accurate,
    ),
  );

  // Faces on ID cards are small, so the minimum face size is low.
  @Named(stillFaceDetector)
  @LazySingleton(dispose: closeFaceDetector)
  FaceDetector get stillDetector => FaceDetector(
    options: FaceDetectorOptions(
      minFaceSize: 0.05,
      performanceMode: FaceDetectorMode.accurate,
    ),
  );

  @lazySingleton
  FaceTrackingRepository faceTrackingRepository(
    CameraFaceTrackingRepository repository,
  ) => repository;
}

Future<void> closeTextRecognizer(TextRecognizer recognizer) =>
    recognizer.close();

Future<void> closeFaceDetector(FaceDetector detector) => detector.close();
