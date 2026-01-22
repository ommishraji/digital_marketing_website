import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  final Color primary;
  final Color accent;

  BackgroundPainter({required this.primary, required this.accent});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    paint.color = primary;
    canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.1), 220, paint);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.2), 320, paint);

    paint.color = accent;
    canvas.drawCircle(
        Offset(size.width * 0.75, size.height * 0.75), 280, paint);
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.8), 200, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
