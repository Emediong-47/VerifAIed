// Renders the app icon and splash artwork into assets/icon.
//
// Run with:  flutter test tool/branding/generate_icons_test.dart
// Then:      dart run flutter_launcher_icons && dart run flutter_native_splash:create
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const size = 1024.0;
const tealLight = Color(0xFF14A390);
const tealDark = Color(0xFF00463D);
const badgeGreen = Color(0xFF3DD68C);

/// flutter_launcher_icons insets adaptive layers by 16%, which matches
/// Android's safe zone; this keeps the viewfinder corners inside it.
const adaptiveScale = 0.95;

/// Android 12+ masks the splash icon to a circle two thirds of its size.
const android12SplashScale = 0.62;

enum Layer { full, foreground, background, monochrome }

void paintIcon(Canvas canvas, Layer layer, {double scale = 1}) {
  final rect = Offset.zero & const Size(size, size);
  if (layer == Layer.full || layer == Layer.background) {
    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [tealLight, tealDark],
        ).createShader(rect),
    );
    const glowCentre = Offset(size / 2, size * 0.47);
    canvas.drawCircle(
      glowCentre,
      size * 0.36,
      Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.white.withValues(alpha: 0.16),
            Colors.white.withValues(alpha: 0),
          ],
        ).createShader(Rect.fromCircle(center: glowCentre, radius: size * 0.36)),
    );
  }
  if (layer == Layer.background) return;

  canvas
    ..save()
    ..translate(size / 2, size / 2)
    ..scale(scale)
    ..translate(-size / 2, -size / 2);

  final white = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  // Viewfinder corners.
  const inset = 196.0, arm = 128.0;
  white.strokeWidth = 52;
  for (final (x, y, dx, dy) in [
    (inset, inset, 1.0, 1.0),
    (size - inset, inset, -1.0, 1.0),
    (inset, size - inset, 1.0, -1.0),
    (size - inset, size - inset, -1.0, -1.0),
  ]) {
    canvas.drawPath(
      Path()
        ..moveTo(x, y + dy * arm)
        ..lineTo(x, y + dy * 24)
        ..quadraticBezierTo(x, y, x + dx * 24, y)
        ..lineTo(x + dx * arm, y),
      white,
    );
  }

  // Face.
  const face = Offset(size / 2, size * 0.485);
  white.strokeWidth = 40;
  canvas.drawOval(Rect.fromCenter(center: face, width: 252, height: 318), white);
  final fill = Paint()..color = Colors.white;
  canvas
    ..drawCircle(face + const Offset(-50, -30), 22, fill)
    ..drawCircle(face + const Offset(50, -30), 22, fill);
  white.strokeWidth = 30;
  canvas.drawArc(
    Rect.fromCenter(center: face + const Offset(0, 34), width: 116, height: 84),
    pi * 0.18,
    pi * 0.64,
    false,
    white,
  );

  // Verified badge.
  const badge = Offset(size * 0.665, size * 0.665);
  final mono = layer == Layer.monochrome;
  if (!mono) canvas.drawCircle(badge, 112, Paint()..color = tealDark);
  canvas.drawCircle(badge, 88, Paint()..color = mono ? Colors.white : badgeGreen);
  canvas.drawPath(
    Path()
      ..moveTo(badge.dx - 40, badge.dy + 2)
      ..lineTo(badge.dx - 12, badge.dy + 30)
      ..lineTo(badge.dx + 42, badge.dy - 28),
    Paint()
      ..color = mono ? Colors.black : Colors.white
      ..blendMode = mono ? BlendMode.clear : BlendMode.srcOver
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round,
  );
  canvas.restore();
}

Future<void> save(String path, Layer layer, {double scale = 1}) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder)
    ..saveLayer(Offset.zero & const Size(size, size), Paint());
  paintIcon(canvas, layer, scale: scale);
  canvas.restore();
  final image = await recorder.endRecording().toImage(
    size.toInt(),
    size.toInt(),
  );
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
  File(path).writeAsBytesSync(bytes!.buffer.asUint8List());
}

void main() {
  test('render icon and splash artwork', () async {
    const dir = 'assets/icon';
    await save('$dir/app_icon.png', Layer.full);
    await save('$dir/app_icon_foreground.png', Layer.foreground, scale: adaptiveScale);
    await save('$dir/app_icon_background.png', Layer.background);
    await save('$dir/app_icon_monochrome.png', Layer.monochrome, scale: adaptiveScale);
    await save('$dir/splash_logo.png', Layer.foreground, scale: 0.9);
    await save('$dir/splash_logo_android12.png', Layer.foreground, scale: android12SplashScale);
  });
}
