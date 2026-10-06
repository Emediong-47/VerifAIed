import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:verif_aled/features/verification/infrastructure/face_image_processor.dart';

abstract interface class FaceEmbedder {
  /// Describes a [FaceImageProcessor.modelInputSize] square face crop.
  Future<List<double>> embed(img.Image face);

  Future<void> close();
}

/// Runs the bundled MobileFaceNet model (112x112x3 in, 192 values out).
@LazySingleton(as: FaceEmbedder)
class MobileFaceNetEmbedder implements FaceEmbedder {
  static const modelAsset = 'assets/models/mobilefacenet.tflite';

  Future<Interpreter>? _interpreter;

  @override
  Future<List<double>> embed(img.Image face) async {
    final interpreter = await (_interpreter ??= Interpreter.fromAsset(
      modelAsset,
    ));
    const size = FaceImageProcessor.modelInputSize;
    final input = FaceImageProcessor.toModelInput(
      face,
    ).reshape([1, size, size, 3]);
    final output = [
      List<double>.filled(interpreter.getOutputTensor(0).shape.last, 0),
    ];

    interpreter.run(input, output);
    return output.first;
  }

  @override
  @disposeMethod
  Future<void> close() async {
    final interpreter = _interpreter;
    _interpreter = null;
    (await interpreter)?.close();
  }
}
