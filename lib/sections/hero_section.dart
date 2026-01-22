import 'dart:math';

import 'package:flutter/material.dart';

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
              const Positioned.fill(
                child: AnimatedHeroParticles(),
              ),
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

    for (int i = 0; i < 15; i++) {
      final yOffset = (progress * size.height * 1.5 + i * 40) % size.height;
      final xBase = (size.width / 15) * i;
      final xOffset = xBase + sin(progress * 3.14159 * 2 + i) * 30;

      paint.color = const Color(0xFFF97316)
          .withOpacity(0.08 - (yOffset / size.height) * 0.08);
      paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawCircle(Offset(xOffset, yOffset), 6, paint);

      paint.color = const Color(0xFFFF6B35)
          .withOpacity(0.15 - (yOffset / size.height) * 0.15);
      paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
      canvas.drawCircle(Offset(xOffset, yOffset), 2, paint);
    }

    final lineY = (progress * size.height) % size.height;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFF97316).withOpacity(0.2);
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawLine(
      Offset(0, lineY),
      Offset(size.width, lineY),
      paint,
    );

    final lineY2 = (progress * size.height + 100) % size.height;
    paint.strokeWidth = 1.5;
    paint.color = const Color(0xFFFF6B35).withOpacity(0.15);
    canvas.drawLine(
      Offset(0, lineY2),
      Offset(size.width, lineY2),
      paint,
    );

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
