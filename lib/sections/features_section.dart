import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../animations/animations.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      (
        Icons.trending_up,
        'Data-Driven Growth',
        'Every decision backed by analytics. We optimize continuously for maximum ROI and measurable results.',
        AppColors.primary,
      ),
      (
        Icons.flash_on,
        'Lightning-Fast Execution',
        'Rapid deployment of campaigns. We move quick without sacrificing quality or strategic thinking.',
        AppColors.accent,
      ),
      (
        Icons.people,
        'Expert Team',
        '16+ years of combined experience. Specialists in SEO, PPC, social, and creative production.',
        AppColors.lightAccent,
      ),
      (
        Icons.shield,
        'Transparent Partnership',
        'Clear reporting and communication. You always know what\'s working and why.',
        AppColors.primary,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SlideFromSideAnimation(
            fromLeft: true,
            child: Text(
              'Why Choose Shubham Digital',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          SlideFromSideAnimation(
            fromLeft: true,
            delay: const Duration(milliseconds: 100),
            child: Text(
              'We combine strategy, creativity, and technology to deliver campaigns that convert',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.gray,
                  ),
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 20,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: features
                .asMap()
                .entries
                .map(
                  (entry) => SlideFromSideAnimation(
                    fromLeft: entry.key % 2 == 0,
                    delay: Duration(milliseconds: 150 + (entry.key * 100)),
                    child: SizedBox(
                      width: 280,
                      child: AnimatedScaleOnHover(
                        child: Container(
                          padding: const EdgeInsets.all(28),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.border,
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
                                      entry.value.$4.withOpacity(0.2),
                                      entry.value.$4.withOpacity(0.05),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  entry.value.$1,
                                  color: entry.value.$4,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                entry.value.$2,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                entry.value.$3,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.gray,
                                      height: 1.6,
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
    );
  }
}
