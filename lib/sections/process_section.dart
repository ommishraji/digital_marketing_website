import 'package:flutter/material.dart';
import '../animations/animations.dart';
import '../config/theme.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.primary.withOpacity(0.1),
            width: 1,
          ),
          bottom: BorderSide(
            color: AppColors.primary.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Stack(
        children: [
          // Decorative background elements
          Positioned(
            right: -100,
            top: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withOpacity(0.15),
                    AppColors.accent.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: -80,
            bottom: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.08),
                    AppColors.primary.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlideFromSideAnimation(
                  fromLeft: false,
                  child: Text('Our Process',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                ),
                const SizedBox(height: 12),
                SlideFromSideAnimation(
                  fromLeft: false,
                  delay: const Duration(milliseconds: 100),
                  child: Container(
                    width: 60,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SlideFromSideAnimation(
                  fromLeft: false,
                  delay: const Duration(milliseconds: 150),
                  child: Text(
                    'A simple, accountable path to measurable growth.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 32),
                Column(
                  children: steps
                      .asMap()
                      .entries
                      .map(
                        (entry) => SlideFromSideAnimation(
                          fromLeft: false,
                          delay: Duration(milliseconds: 200 + (entry.key * 100)),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: AnimatedScaleOnHover(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: AppColors.primary.withOpacity(0.3),
                                      width: 3,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      margin: const EdgeInsets.only(right: 16, left: 12),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withOpacity(0.08),
                                        border: Border.all(
                                          color: AppColors.primary.withOpacity(0.3),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${entry.key + 1}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primary,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(entry.value.$1,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                          const SizedBox(height: 6),
                                          Text(entry.value.$2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: Colors.grey[700],
                                                  )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
