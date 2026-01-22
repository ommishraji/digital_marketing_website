import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'widgets/header.dart';
import 'widgets/smooth_physics_cursor.dart';
import 'sections/hero_section.dart';
import 'sections/features_section.dart';

void main() {
  runApp(const ShubhamDigitalMarketingApp());
}

class ShubhamDigitalMarketingApp extends StatelessWidget {
  const ShubhamDigitalMarketingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shubham Digital Marketing',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Offset _mousePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            _mousePosition = event.localPosition;
          });
        },
        child: Stack(
          children: [
            const Positioned.fill(child: EnhancedBackgroundTexture()),
            Positioned.fill(
              child: CursorTrackingBackground(),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Header(),
                  HeroSection(mousePosition: _mousePosition),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1320),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 60),
                          FeaturesSection(),
                          SizedBox(height: 60),
                          // More sections can be added here
                          SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Page-wide mouse tracker effect
            IgnorePointer(
              child: Positioned.fill(
                child: SmoothPhysicsCursor(targetPosition: _mousePosition),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

    paint.color = primary;
    canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.1), 220, paint);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.2), 320, paint);

    paint.color = accent;
    canvas.drawCircle(
        Offset(size.width * 0.75, size.height * 0.75), 280, paint);
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.8), 200, paint);

    paint.color = const Color(0xFFFF6B35).withOpacity(0.08);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.35), 150, paint);
    paint.color = const Color(0xFFFF8C42).withOpacity(0.06);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.65), 180, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CursorTrackingBackground extends StatefulWidget {
  const CursorTrackingBackground({super.key});

  @override
  State<CursorTrackingBackground> createState() =>
      _CursorTrackingBackgroundState();
}

class _CursorTrackingBackgroundState extends State<CursorTrackingBackground> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand();
  }
}
