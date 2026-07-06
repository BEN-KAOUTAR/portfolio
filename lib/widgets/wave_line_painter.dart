import 'package:flutter/material.dart';
import 'dart:math';

/// A simple wave-line custom painter (decorative use).
class WaveLinePainter extends CustomPainter {
  final Color color;
  final double amplitude;
  final double frequency;

  const WaveLinePainter({
    this.color = const Color(0xFF00FFCC),
    this.amplitude = 6,
    this.frequency = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.35)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height / 2);

    for (double x = 0; x <= size.width; x++) {
      final y =
          size.height / 2 + amplitude * sin((x / size.width) * frequency * 2 * pi);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WaveLinePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.amplitude != amplitude ||
      oldDelegate.frequency != frequency;
}
