import 'package:flutter/material.dart';
import 'hover_widget.dart';

// ─── Timeline Bubble ──────────────────────────────────────────────────────────
class TimelineBubble extends StatelessWidget {
  final String title;
  final String body;
  final bool isLeft;
  final bool showDotOnLeft;

  const TimelineBubble({
    super.key,
    required this.title,
    required this.body,
    required this.isLeft,
    this.showDotOnLeft = false,
  });

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      builder: (isHovered) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFF0D0A24).withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isHovered
                      ? const Color(0xFF00FFCC)
                      : const Color(0x3300FFCC),
                  width: 1,
                ),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: const Color(0xFF00FFCC).withValues(alpha: 0.2),
                          blurRadius: 20,
                        )
                      ]
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00FFCC),
                      shadows: [Shadow(color: Color(0x4400FFCC), blurRadius: 4)],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    body,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
            if (showDotOnLeft)
              Positioned(
                left: -34,
                top: 24,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF030014),
                    border:
                        Border.all(color: const Color(0xFF00FFCC), width: 4),
                    boxShadow: const [
                      BoxShadow(color: Color(0xFF00FFCC), blurRadius: 6),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
