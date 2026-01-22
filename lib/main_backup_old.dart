import 'package:flutter/material.dart';
import 'dart:math';

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
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF97316),
          primary: const Color(0xFFF97316),
          secondary: const Color(0xFF0E1B2C),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0E1B2C),
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0E1B2C),
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0E1B2C),
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0E1B2C),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF1F2937),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: Color(0xFF374151),
          ),
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
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
  Offset _trackerPosition = Offset.zero;

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
                          StatsRow(),
                          SizedBox(height: 60),
                          ServicesSection(),
                          SizedBox(height: 60),
                          ProcessSection(),
                          SizedBox(height: 60),
                          CTASection(),
                          SizedBox(height: 48),
                          Footer(),
                          SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Page-wide mouse tracker effect - using IgnorePointer so it doesn't block interactions
            IgnorePointer(
              child: Positioned.fill(
                child: SimpleShadowCursor(mousePosition: _mousePosition),
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

class CursorTrackingBackground extends StatelessWidget {
  const CursorTrackingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand();
  }
}

class SimpleShadowCursor extends StatefulWidget {
  const SimpleShadowCursor({super.key, required this.mousePosition});

  final Offset mousePosition;

  @override
  State<SimpleShadowCursor> createState() => _SimpleShadowCursorState();
}

class _SimpleShadowCursorState extends State<SimpleShadowCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset _smoothMousePosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SimpleShadowCursor oldWidget) {
    super.didUpdateWidget(oldWidget);
    _smoothMousePosition = widget.mousePosition;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Smooth interpolation - 0.12 provides responsive smooth following like HTML implementations
        _smoothMousePosition = Offset.lerp(
          _smoothMousePosition,
          widget.mousePosition,
          0.12,
        )!;
        return CustomPaint(
          painter: _ShadowCursorPainter(
            mousePosition: _smoothMousePosition,
          ),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class _ShadowCursorPainter extends CustomPainter {
  _ShadowCursorPainter({required this.mousePosition});

  final Offset mousePosition;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..color = const Color(0xFFF97316);

    // Draw a circular point with 8px diameter (4px radius)
    canvas.drawCircle(mousePosition, 4, paint);
  }

  @override
  bool shouldRepaint(_ShadowCursorPainter oldDelegate) =>
      oldDelegate.mousePosition != mousePosition;
}

class BackgroundTexture extends StatelessWidget {
  const BackgroundTexture({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TexturePainter(
        primary: Theme.of(context).colorScheme.primary.withOpacity(0.12),
        accent: const Color(0xFF0E1B2C).withOpacity(0.05),
      ),
    );
  }
}

class _TexturePainter extends CustomPainter {
  _TexturePainter({required this.primary, required this.accent});

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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 900;
            final items = ['About', 'Services', 'Portfolio', 'Blog', 'Contact'];
            return Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            const Color(0xFFFF6B35),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.25),
                            blurRadius: 14,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.flash_on,
                          color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Shubham',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0E1B2C),
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          'Digital Marketing',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                if (!isNarrow)
                  ...items
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              item,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF374151),
                                    letterSpacing: 0.3,
                                  ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 10,
                    shadowColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.35),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Get Consultation',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AnimatedHeroParticles extends StatefulWidget {
  const AnimatedHeroParticles({super.key});

  @override
  State<AnimatedHeroParticles> createState() => _AnimatedHeroParticlesState();
}

class _AnimatedHeroParticlesState extends State<AnimatedHeroParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
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
          painter: _HeroParticlesPainter(
            progress: _controller.value,
          ),
        );
      },
    );
  }
}

class _HeroParticlesPainter extends CustomPainter {
  final double progress;

  _HeroParticlesPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    // Animated floating particles
    for (int i = 0; i < 15; i++) {
      final yOffset = (progress * size.height * 1.5 + i * 40) % size.height;
      final xBase = (size.width / 15) * i;
      final xOffset = xBase + sin(progress * 3.14159 * 2 + i) * 30;

      // Particle glow
      paint.color = const Color(0xFFF97316)
          .withOpacity(0.08 - (yOffset / size.height) * 0.08);
      paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawCircle(Offset(xOffset, yOffset), 6, paint);

      // Particle core
      paint.color = const Color(0xFFFF6B35)
          .withOpacity(0.15 - (yOffset / size.height) * 0.15);
      paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
      canvas.drawCircle(Offset(xOffset, yOffset), 2, paint);
    }

    // Animated tech lines flowing across
    final lineY = (progress * size.height) % size.height;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFF97316).withOpacity(0.2);
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawLine(
      Offset(0, lineY),
      Offset(size.width, lineY),
      paint,
    );

    // Secondary tech line with offset
    final lineY2 = (progress * size.height + 100) % size.height;
    paint.strokeWidth = 1.5;
    paint.color = const Color(0xFFFF6B35).withOpacity(0.15);
    canvas.drawLine(
      Offset(0, lineY2),
      Offset(size.width, lineY2),
      paint,
    );

    // Diagonal animated lines
    paint.strokeWidth = 1;
    paint.color = const Color(0xFFF97316).withOpacity(0.1);
    final diagonalOffset = (progress * size.width) % size.width;
    canvas.drawLine(
      Offset(diagonalOffset - size.width, 0),
      Offset(diagonalOffset, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(_HeroParticlesPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class HeroSection extends StatefulWidget {
  const HeroSection({super.key, this.mousePosition = Offset.zero});

  final Offset mousePosition;

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _slide;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<double>(begin: 22, end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));
    _scale = Tween<double>(begin: 0.92, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 1000;
        final heroImage =
            'https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=1600&q=80';
        return Container(
          height: isNarrow ? 600 : 650,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(heroImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Dark overlay for better text readability
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF0E1B2C).withOpacity(0.6),
                      const Color(0xFF0E1B2C).withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              // Animated accent gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.15),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),
              // Animated tech particles background
              const Positioned.fill(
                child: AnimatedHeroParticles(),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ScaleTransition(
                  scale: _scale,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity: _fade,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: theme.colorScheme.primary
                                        .withOpacity(0.5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.trending_up,
                                        color: Colors.white, size: 18),
                                    const SizedBox(width: 8),
                                    Text(
                                      '16+ Years of Digital Excellence',
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Transform Your Business\nWith Cutting-Edge Digital Marketing',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headlineLarge!.copyWith(
                                  color: Colors.white,
                                  fontSize: 52,
                                  fontWeight: FontWeight.w900,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Drive growth, engagement, and revenue with data-driven strategies\ntailored to your business goals',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          theme.colorScheme.primary,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32, vertical: 18),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      elevation: 12,
                                      shadowColor: theme.colorScheme.primary
                                          .withOpacity(0.6),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Start Your Journey',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Colors.white70, width: 2),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32, vertical: 18),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Learn More',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({
    required this.fade,
    required this.slide,
    required this.theme,
  });

  final Animation<double> fade;
  final Animation<double> slide;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fade,
      child: AnimatedBuilder(
        animation: slide,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, slide.value),
            child: child,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bolt, color: theme.colorScheme.primary, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Award-winning digital growth partner',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'We craft digital-first experiences\nthat grow modern brands.',
              style: theme.textTheme.headlineLarge!.copyWith(height: 1.2),
            ),
            const SizedBox(height: 18),
            Text(
              'Shubham Digital Marketing blends strategy, storytelling, and performance to deliver campaigns that convert. From SEO to social, we align every click with revenue.',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    elevation: 10,
                    shadowColor: theme.colorScheme.primary.withOpacity(0.4),
                  ),
                  onPressed: () {},
                  child: const Text('Book Your Consultation'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    side: BorderSide(
                        color: theme.colorScheme.primary, width: 1.4),
                  ),
                  onPressed: () {},
                  child: Text(
                    'View Portfolio',
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: const [
                BadgeChip(
                    icon: Icons.emoji_events, label: '16+ Years Experience'),
                BadgeChip(
                    icon: Icons.trending_up, label: 'ROI-Driven Campaigns'),
                BadgeChip(
                    icon: Icons.thumb_up, label: 'Trusted by 250+ Brands'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeroImageCard extends StatefulWidget {
  const HeroImageCard({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<HeroImageCard> createState() => _HeroImageCardState();
}

class _HeroImageCardState extends State<HeroImageCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _tilt;
  late final Animation<double> _float;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _tilt = Tween<double>(begin: -0.015, end: 0.015).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine,
    ));
    _float = Tween<double>(begin: -8, end: 8).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: Listenable.merge([_tilt, _float]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _float.value),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateZ(_tilt.value),
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 30,
            top: 30,
            child: ScaleAnimation(
              delay: const Duration(milliseconds: 300),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.16),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 28,
                  offset: const Offset(0, 18),
                ),
                BoxShadow(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.15),
                  blurRadius: 40,
                  offset: const Offset(0, 22),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -18,
            left: 18,
            child: SlideAnimation(
              delay: const Duration(milliseconds: 500),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 18,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor:
                          theme.colorScheme.primary.withOpacity(0.15),
                      child: Icon(Icons.auto_graph,
                          color: theme.colorScheme.primary),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Average ROAS 4.6x',
                          style: theme.textTheme.titleMedium,
                        ),
                        Text(
                          'Performance snapshot',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BadgeChip extends StatelessWidget {
  const BadgeChip({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111827),
                ),
          ),
        ],
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      (
        Icons.trending_up,
        'Data-Driven Growth',
        'Every decision backed by analytics. We optimize continuously for maximum ROI and measurable results.',
        const Color(0xFFF97316),
      ),
      (
        Icons.flash_on,
        'Lightning-Fast Execution',
        'Rapid deployment of campaigns. We move quick without sacrificing quality or strategic thinking.',
        const Color(0xFFFF6B35),
      ),
      (
        Icons.people,
        'Expert Team',
        '16+ years of combined experience. Specialists in SEO, PPC, social, and creative production.',
        const Color(0xFFFF8C42),
      ),
      (
        Icons.shield,
        'Transparent Partnership',
        'Clear reporting and communication. You always know what\'s working and why.',
        const Color(0xFFF97316),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            'Why Choose Shubham Digital',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'We combine strategy, creativity, and technology to deliver campaigns that convert',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color(0xFF6B7280),
                ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 20,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: features
                .map(
                  (f) => SizedBox(
                    width: 280,
                    child: AnimatedScaleOnHover(
                      child: Container(
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    f.$4.withOpacity(0.2),
                                    f.$4.withOpacity(0.05),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                f.$1,
                                color: f.$4,
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              f.$2,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              f.$3,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: const Color(0xFF6B7280),
                                    height: 1.6,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      ('250+', 'Campaigns Launched'),
      ('4.6x', 'Avg. ROAS Across Accounts'),
      ('98%', 'Client Satisfaction'),
      ('16+', 'Years of Experience'),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        spacing: 16,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: stats
            .map(
              (s) => AnimatedScaleOnHover(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 18,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        s.$1,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                      Text(
                        s.$2,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      (
        Icons.auto_awesome,
        'Digital Marketing & Branding',
        'Brand strategy, positioning, and full-funnel campaigns that connect with your audience.',
      ),
      (
        Icons.manage_search,
        'SEO & Content',
        'Technical SEO, content calendars, and authority building that lift your visibility.',
      ),
      (
        Icons.social_distance,
        'Social Media Marketing',
        'Channel-first social playbooks, creative sprints, and paid performance at scale.',
      ),
      (
        Icons.web,
        'Web Design & Development',
        'Conversion-focused websites with clean UX, rapid performance, and CMS handoff.',
      ),
      (
        Icons.campaign,
        'Paid Ads Management',
        'Search, display, and social ads optimized weekly with crystal-clear reporting.',
      ),
      (
        Icons.design_services,
        'Creative & Graphic Design',
        'On-brand visual systems, campaign creatives, and motion snippets that pop.',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Services', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            'What we deliver to accelerate Shubham Digital Marketing clients.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 1100
                  ? 3
                  : constraints.maxWidth > 780
                      ? 2
                      : 1;
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final service = services[index];
                  return AnimatedScaleOnHover(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 18,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                service.$1,
                                color: Theme.of(context).colorScheme.primary,
                                size: 26,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              service.$2,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              service.$3,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  'Learn more',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                                const SizedBox(width: 6),
                                Icon(Icons.arrow_outward,
                                    size: 18,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      (
        'Discovery & Audit',
        'We map your goals, audiences, and current funnel to find quick wins.'
      ),
      (
        'Strategy & Roadmap',
        'Channel mix, budget pacing, and creative pillars in a clear 90-day plan.'
      ),
      (
        'Launch & Optimize',
        'Sprint-based launches with weekly optimization and transparent reporting.'
      ),
      (
        'Scale',
        'Double down on winners and expand with experimentation loops.'
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Our Process', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(
            'A simple, accountable path to measurable growth.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Column(
            children: steps
                .asMap()
                .entries
                .map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: AnimatedScaleOnHover(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                '${entry.key + 1}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(entry.value.$1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                const SizedBox(height: 6),
                                Text(entry.value.$2,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.colorScheme.primary, const Color(0xFFFB923C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.35),
              blurRadius: 28,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 800;
            final copy = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Want a free SEO & ads audit?',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Share your domain and goals. We will send a 10-point action plan tailored for Shubham Digital Marketing.',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: Colors.white70),
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.mail, color: theme.colorScheme.primary),
                          const SizedBox(width: 8),
                          const Text('hello@shubhamdigital.com'),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.phone, color: theme.colorScheme.primary),
                          const SizedBox(width: 8),
                          const Text('+91 98765 43210'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );

            final form = Container(
              constraints: const BoxConstraints(maxWidth: 420),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _TextField(hint: 'Your Name'),
                  const SizedBox(height: 10),
                  _TextField(hint: 'Work Email'),
                  const SizedBox(height: 10),
                  _TextField(hint: 'Website / Domain'),
                  const SizedBox(height: 10),
                  _TextField(hint: 'Goals (traffic, leads, revenue)'),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      child: const Text('Request Audit'),
                    ),
                  ),
                ],
              ),
            );

            if (isNarrow) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  copy,
                  const SizedBox(height: 16),
                  form,
                ],
              );
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: copy),
                const SizedBox(width: 24),
                form,
              ],
            );
          },
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 32, color: Color(0xFFE5E7EB)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              const Icon(Icons.flash_on, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Shubham Digital Marketing',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0E1B2C),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'We partner with brands to create performance marketing systems that scale with clarity and confidence.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Company',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('About us\nPortfolio\nCareers\nContact',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Services',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'SEO Services\nSocial Media Marketing\nWeb Development\nCreative Design',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Get Connected',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        SocialIcon(icon: Icons.facebook),
                        SocialIcon(icon: Icons.message),
                        SocialIcon(icon: Icons.linked_camera),
                        SocialIcon(icon: Icons.alternate_email),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            '© 2025 Shubham Digital Marketing. All rights reserved.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: const Color(0xFF111827)),
    );
  }
}

class AnimatedScaleOnHover extends StatefulWidget {
  const AnimatedScaleOnHover({super.key, required this.child});

  final Widget child;

  @override
  State<AnimatedScaleOnHover> createState() => _AnimatedScaleOnHoverState();
}

class _AnimatedScaleOnHoverState extends State<AnimatedScaleOnHover> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedScale(
        scale: hovering ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, hovering ? -4.0 : 0.0)
            ..scale(hovering ? 1.0 : 0.999),
          child: widget.child,
        ),
      ),
    );
  }
}

// New Animation Helper Widgets

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  final Widget child;
  final Duration delay;

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });

    _scaleAnimation =
        Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.direction = Axis.vertical,
  });

  final Widget child;
  final Duration delay;
  final Axis direction;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });

    final offset = widget.direction == Axis.vertical
        ? const Offset(0, 0.5)
        : const Offset(0.5, 0);

    _slideAnimation = Tween<Offset>(begin: offset, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _controller,
        child: widget.child,
      ),
    );
  }
}

class PulseAnimation extends StatefulWidget {
  const PulseAnimation({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pulseAnimation =
        Tween<double>(begin: 1.0, end: 1.05).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _pulseAnimation,
      child: widget.child,
    );
  }
}

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 3000),
  });

  final Widget child;
  final Duration duration;

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }
}
