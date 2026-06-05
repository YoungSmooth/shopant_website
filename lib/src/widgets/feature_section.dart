import 'package:flutter/material.dart';

import 'shared_widgets.dart';

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 56.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'A more polished commerce experience',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          const Text(
            'Shopant layers precision discovery, curated journeys, and data-driven personalization without adding complexity to your storefront.',
            style: TextStyle(fontSize: 17, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = constraints.maxWidth < 940
                  ? constraints.maxWidth
                  : (constraints.maxWidth - 48) / 3;

              return Wrap(
                runSpacing: 24,
                spacing: 24,
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: const FeatureCard(
                      title: 'Better product direction',
                      description:
                          'Reduce browsing fatigue by guiding shoppers with precise category signals and result tuning.',
                      icon: Icons.search,
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const FeatureCard(
                      title: 'Curated store journeys',
                      description:
                          'Turn one search into a personalized path of relevant collections and product recommendations.',
                      icon: Icons.auto_awesome_motion,
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: const FeatureCard(
                      title: 'Live discovery intelligence',
                      description:
                          'Build trust from the first interaction with seamless search, filters, and intent-aware insights.',
                      icon: Icons.flash_on,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
