import 'dart:io';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:verif_aled/features/verification/infrastructure/face_image_processor.dart';

void main() {
  const size = FaceImageProcessor.modelInputSize;
  final background = img.ColorRgb8(0, 0, 255);
  final faceColour = img.ColorRgb8(255, 0, 0);

  /// A blue image with a red square where the "face" is.
  img.Image imageWithFace(int width, int height, Rect face) {
    final image = img.Image(width: width, height: height);
    img.fill(image, color: background);
    img.fillRect(
      image,
      x1: face.left.round(),
      y1: face.top.round(),
      x2: face.right.round(),
      y2: face.bottom.round(),
      color: faceColour,
    );
    return image;
  }

  bool isFaceColour(img.Pixel pixel) =>
      pixel.r > 200 && pixel.g < 50 && pixel.b < 50;

  group('cropFace', () {
    test('returns a model-sized square centred on the face', () {
      // Arrange
      const face = Rect.fromLTWH(150, 100, 200, 200);
      final image = imageWithFace(600, 400, face);

      // Act
      final crop = FaceImageProcessor.cropFace(image, face);

      // Assert
      expect(crop.width, size);
      expect(crop.height, size);
      expect(isFaceColour(crop.getPixel(size ~/ 2, size ~/ 2)), isTrue);
    });

    test('keeps a margin of background around the face', () {
      // Arrange
      const face = Rect.fromLTWH(150, 100, 200, 200);
      final image = imageWithFace(600, 400, face);

      // Act
      final crop = FaceImageProcessor.cropFace(image, face);

      // Assert
      expect(isFaceColour(crop.getPixel(0, 0)), isFalse);
      expect(isFaceColour(crop.getPixel(size - 1, size - 1)), isFalse);
    });

    test('shifts the crop inside the image for a face at the edge', () {
      // Arrange
      const face = Rect.fromLTWH(0, 0, 50, 50);
      final image = imageWithFace(200, 200, face);

      // Act
      final crop = FaceImageProcessor.cropFace(image, face);

      // Assert
      expect(crop.width, size);
      expect(isFaceColour(crop.getPixel(0, 0)), isTrue);
    });

    test('limits the crop to the image for a face larger than it', () {
      // Arrange
      const face = Rect.fromLTWH(-50, -50, 400, 400);
      final image = imageWithFace(
        200,
        120,
        const Rect.fromLTWH(0, 0, 200, 120),
      );

      // Act
      final crop = FaceImageProcessor.cropFace(image, face);

      // Assert
      expect(crop.width, size);
      expect(crop.height, size);
    });
  });

  group('toModelInput', () {
    test('scales each channel from 0..255 to about -1..1', () {
      // Arrange
      final image = img.Image(width: 1, height: 1)
        ..setPixelRgb(0, 0, 255, 0, 128);

      // Act
      final input = FaceImageProcessor.toModelInput(image);

      // Assert
      expect(input, [127 / 128, -1, 0]);
    });

    test('writes pixels row by row as RGB triples', () {
      // Arrange
      final image = img.Image(width: 2, height: 1)
        ..setPixelRgb(0, 0, 128, 128, 128)
        ..setPixelRgb(1, 0, 0, 0, 0);

      // Act
      final input = FaceImageProcessor.toModelInput(image);

      // Assert
      expect(input, [0, 0, 0, -1, -1, -1]);
    });

    test('produces width x height x 3 values for a model-sized crop', () {
      // Arrange
      final image = img.Image(width: size, height: size);

      // Act
      final input = FaceImageProcessor.toModelInput(image);

      // Assert
      expect(input, hasLength(size * size * 3));
    });
  });

  group('loadAndCropFace', () {
    late Directory directory;

    setUp(() => directory = Directory.systemTemp.createTempSync('faces'));

    tearDown(() => directory.deleteSync(recursive: true));

    test('reads an image file and crops the face', () {
      // Arrange
      const face = Rect.fromLTWH(50, 50, 100, 100);
      final file = File('${directory.path}/photo.png')
        ..writeAsBytesSync(img.encodePng(imageWithFace(200, 200, face)));

      // Act
      final crop = FaceImageProcessor.loadAndCropFace(file.path, face);

      // Assert
      expect(crop, isNotNull);
      expect(crop!.width, size);
      expect(isFaceColour(crop.getPixel(size ~/ 2, size ~/ 2)), isTrue);
    });

    test('returns null for a file that is not an image', () {
      // Arrange
      final file = File('${directory.path}/notes.txt')
        ..writeAsStringSync('not an image');

      // Act
      final crop = FaceImageProcessor.loadAndCropFace(
        file.path,
        const Rect.fromLTWH(0, 0, 10, 10),
      );

      // Assert
      expect(crop, isNull);
    });
  });
}
