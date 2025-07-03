// Custom painter for dotted background pattern
import 'package:flutter/material.dart';

class DottedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    const double dotRadius = 1.5;
    const double spacing = 25.0;

    // Create gradient dots
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        // Calculate opacity based on position for subtle gradient effect
        final normalizedX = x / size.width;
        final normalizedY = y / size.height;
        final distance = (normalizedX + normalizedY) / 2;

        paint.color = Color.lerp(
          const Color(0xFF64B5F6).withOpacity(0.15),
          const Color(0xFF2196F3).withOpacity(0.08),
          distance,
        )!;

        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }

    // Add some scattered accent dots for visual interest
    final accentPaint = Paint()
      ..color = const Color(0xFF2196F3).withOpacity(0.2)
      ..style = PaintingStyle.fill;

    // Add accent dots at specific positions
    final accentPositions = [
      Offset(size.width * 0.2, size.height * 0.3),
      Offset(size.width * 0.7, size.height * 0.1),
      Offset(size.width * 0.1, size.height * 0.8),
      Offset(size.width * 0.8, size.height * 0.6),
      Offset(size.width * 0.5, size.height * 0.9),
    ];

    for (final position in accentPositions) {
      canvas.drawCircle(position, 2.5, accentPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
