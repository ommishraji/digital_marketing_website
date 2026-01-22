import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';

class SmoothPhysicsCursor extends StatefulWidget {
  const SmoothPhysicsCursor({super.key, required this.targetPosition});

  final Offset targetPosition;

  @override
  State<SmoothPhysicsCursor> createState() => _SmoothPhysicsCursorState();
}

class _SmoothPhysicsCursorState extends State<SmoothPhysicsCursor>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  Offset _currentPosition = Offset.zero;
  static const double _speed = 5.0;

  @override
  void initState() {
    super.initState();
    _currentPosition = widget.targetPosition;
    _ticker = createTicker(_onTick);
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    if (_currentPosition == widget.targetPosition) return;

    final double dt = 1.0 / 12.0;
    final double friction = 1.0 - math.exp(-_speed * dt);

    Offset newPos = Offset(
      _lerpDouble(_currentPosition.dx, widget.targetPosition.dx, friction),
      _lerpDouble(_currentPosition.dy, widget.targetPosition.dy, friction),
    );

    if ((newPos - widget.targetPosition).distanceSquared < 0.1) {
      newPos = widget.targetPosition;
    }

    setState(() {
      _currentPosition = newPos;
    });
  }

  double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ShadowCursorPainter(mousePosition: _currentPosition),
      child: const SizedBox.expand(),
    );
  }
}

class _ShadowCursorPainter extends CustomPainter {
  _ShadowCursorPainter({required this.mousePosition});

  final Offset mousePosition;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    canvas.drawCircle(mousePosition, 5, paint);

    final borderPaint = Paint()
      ..color = Colors.orange.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = .5;

    canvas.drawCircle(mousePosition, 5, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _ShadowCursorPainter oldDelegate) {
    return oldDelegate.mousePosition != mousePosition;
  }
}
