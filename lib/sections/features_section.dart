import 'package:flutter/material.dart';
import '../animations/animations.dart';
import '../config/theme.dart';

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
                  color: AppColors.gray,
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
                                    color: AppColors.gray,
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
