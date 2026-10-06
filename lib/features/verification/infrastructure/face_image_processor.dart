import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:image/image.dart' as img;

/// Prepares face crops for MobileFaceNet. Pure functions, so they can run in
/// a background isolate.
abstract final class FaceImageProcessor {
  static const modelInputSize = 112;

  /// Extra space kept around the detected face, as a fraction of its size.
  static const margin = 0.1;

  /// Reads the photo at [path], applies its EXIF rotation and crops [face].
  /// Returns null when the file is not a readable image.
  static img.Image? loadAndCropFace(String path, Rect face) {
    final decoded = img.decodeImage(File(path).readAsBytesSync());
    if (decoded == null) return null;
    return cropFace(img.bakeOrientation(decoded), face);
  }

  /// A square crop centred on [face], resized to the model input size.
  static img.Image cropFace(img.Image image, Rect face) {
    final side = min(
      max(face.width, face.height) * (1 + 2 * margin),
      min(image.width, image.height).toDouble(),
    ).round();
    final left = (face.center.dx - side / 2).round().clamp(
      0,
      image.width - side,
    );
    final top = (face.center.dy - side / 2).round().clamp(
      0,
      image.height - side,
    );

    final crop = img.copyCrop(
      image,
      x: left,
      y: top,
      width: side,
      height: side,
    );
    return img.copyResize(
      crop,
      width: modelInputSize,
      height: modelInputSize,
      interpolation: img.Interpolation.linear,
    );
  }

  /// RGB values scaled to roughly -1..1, row by row, as MobileFaceNet expects.
  static Float32List toModelInput(img.Image face) {
    final input = Float32List(face.width * face.height * 3);
    var i = 0;
    for (var y = 0; y < face.height; y++) {
      for (var x = 0; x < face.width; x++) {
        final pixel = face.getPixel(x, y);
        input[i++] = (pixel.r - 128) / 128;
        input[i++] = (pixel.g - 128) / 128;
        input[i++] = (pixel.b - 128) / 128;
      }
    }
    return input;
  }
}
