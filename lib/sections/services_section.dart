import 'package:flutter/material.dart';
import '../animations/animations.dart';

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
