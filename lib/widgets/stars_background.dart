import 'dart:math';
import 'package:flutter/material.dart';

// ─── Star Data Model ──────────────────────────────────────────────────────────
class StarData {
  final double x;
  final double y;
  final double size;
  final double speed;
  final double baseAlpha;

  StarData({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.baseAlpha,
  });
}

// ─── Stars Painter ────────────────────────────────────────────────────────────
class StarsPainter extends CustomPainter {
  final List<StarData> stars;
  final double animationValue;

  StarsPainter(this.stars, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    for (var star in stars) {
      final double sineVal = sin(animationValue * 2 * pi * 5 * star.speed);
      final double alpha = (star.baseAlpha + sineVal * 0.35).clamp(0.05, 1.0);

      paint.color = Colors.white.withOpacity(alpha);

      final double starX = star.x * size.width;
      final double starY =
          (star.y * size.height + animationValue * 40 * star.speed) % size.height;

      if (star.size > 1.2 && alpha > 0.6) {
        final glowPaint = Paint()
          ..color = const Color(0xFF00FFCC).withOpacity(alpha * 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0);
        canvas.drawCircle(Offset(starX, starY), star.size * 2, glowPaint);
      }

      canvas.drawCircle(Offset(starX, starY), star.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant StarsPainter oldDelegate) => true;
}

// ─── Twinkling Stars Background Widget ───────────────────────────────────────
class TwinklingStarsBackground extends StatefulWidget {
  const TwinklingStarsBackground({super.key});

  @override
  State<TwinklingStarsBackground> createState() =>
      _TwinklingStarsBackgroundState();
}

class _TwinklingStarsBackgroundState extends State<TwinklingStarsBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<StarData> _stars = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    for (int i = 0; i < 150; i++) {
      _stars.add(StarData(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: 0.5 + _random.nextDouble() * 1.5,
        speed: 0.05 + _random.nextDouble() * 0.15,
        baseAlpha: 0.1 + _random.nextDouble() * 0.8,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: StarsPainter(_stars, _controller.value),
        );
      },
    );
  }
}
