import 'package:flutter/material.dart';

import 'shared_widgets.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 900;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isNarrow ? 20.0 : 48.0,
            vertical: 56.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select the experience that transforms your storefront',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              const Text(
                'Choose the right experience type and watch Shopant optimize every shopper journey with premium commerce intelligence.',
                style: TextStyle(fontSize: 17, color: Color(0xFFCBD5E1)),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  ExperienceBadge(label: 'Fashion'),
                  ExperienceBadge(label: 'Beauty'),
                  ExperienceBadge(label: 'Electronics'),
                  ExperienceBadge(label: 'Home'),
                  ExperienceBadge(label: 'Lifestyle'),
                ],
              ),
              const SizedBox(height: 36),
              if (isNarrow) ...[
                const SelectedExperienceCard(
                  title: 'Smart Search',
                  description:
                      'Curated discovery when shoppers start with a broad idea, not a product.',
                  tag: 'Selected experience',
                ),
                const SizedBox(height: 24),
                const SelectedExperienceChart(),
              ] else ...[
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: SelectedExperienceCard(
                          title: 'Smart Search',
                          description:
                              'Curated discovery when shoppers start with a broad idea, not a product.',
                          tag: 'Selected experience',
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(flex: 3, child: SelectedExperienceChart()),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
