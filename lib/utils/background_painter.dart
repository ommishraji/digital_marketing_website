import 'package:flutter/material.dart';

class EnhancedBackgroundTexture extends StatelessWidget {
  const EnhancedBackgroundTexture({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _EnhancedTexturePainter(
        primary: Theme.of(context).colorScheme.primary.withOpacity(0.12),
        accent: const Color(0xFF0E1B2C).withOpacity(0.05),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFF97316).withOpacity(0.08),
              const Color(0xFFFFEDD5).withOpacity(0.05),
              const Color(0xFF0E1B2C).withOpacity(0.03),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }
}

class _EnhancedTexturePainter extends CustomPainter {
  _EnhancedTexturePainter({required this.primary, required this.accent});

  final Color primary;
  final Color accent;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Bold digital marketing themed circles with gradients
    paint.color = primary;
    canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.1), 220, paint);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.2), 320, paint);

    paint.color = accent;
    canvas.drawCircle(
        Offset(size.width * 0.75, size.height * 0.75), 280, paint);
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.8), 200, paint);

    // Additional accent circles for digital marketing feel
    paint.color = const Color(0xFFFF6B35).withOpacity(0.08);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.35), 150, paint);
    paint.color = const Color(0xFFFF8C42).withOpacity(0.06);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.65), 180, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}