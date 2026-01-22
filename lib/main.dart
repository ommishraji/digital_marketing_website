import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/scheduler.dart';
import 'config/theme.dart';
import 'widgets/header.dart';
import 'widgets/smooth_physics_cursor.dart';
import 'sections/hero_section.dart';
import 'sections/features_section.dart';
import 'sections/stats_section.dart';
import 'sections/services_section.dart';
import 'sections/process_section.dart';
import 'sections/cta_section.dart';
import 'sections/footer.dart';
import 'utils/background_painter.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Offset _mousePosition = Offset.zero;
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick);
    _ticker.start();
  }

  void _onTick(Duration elapsed) {
    setState(() {});
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            _mousePosition = event.position;
          });
        },
        child: Stack(
          children: [
            // background
            const Positioned.fill(child: EnhancedBackgroundTexture()),
            // Main content
            SingleChildScrollView(
              child: Column(
                children: [
                  const Header(),
                  HeroSection(mousePosition: _mousePosition),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1320),
                      child: const Column(
                        children: [
                          SizedBox(height: 24),
                          FeaturesSection(),
                          SizedBox(height: 24),
                          StatsRow(),
                          SizedBox(height: 24),
                          ServicesSection(),
                          SizedBox(height: 24),
                          ProcessSection(),
                          SizedBox(height: 24),
                          CTASection(),
                          SizedBox(height: 24),
                          Footer(),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Mouse tracker - positioned inside Stack with Positioned widget
            // Positioned(
            //   left: _mousePosition.dx - 1,
            //   top: _mousePosition.dy - 1,
            //   child:
               IgnorePointer(
                child: SmoothPhysicsCursor(targetPosition: _mousePosition),
              ),
            // ),
          ],
        ),
      ),
    );
  }
}
