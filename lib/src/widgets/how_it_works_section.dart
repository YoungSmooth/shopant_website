import 'package:flutter/material.dart';

import '../theme.dart';
import 'shared_widgets.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF020617),
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 56.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How Shopant works',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'A premium workflow designed for modern storefronts: capture intent, personalize discovery, and accelerate buyer confidence.',
            style: TextStyle(fontSize: 17, color: AppTheme.brandMuted),
          ),
          const SizedBox(height: 38),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: const [
              ProcessCard(
                step: '01',
                title: 'Sense intent',
                description:
                    'Shopant understands vague search and shopping behavior before the first click.',
              ),
              ProcessCard(
                step: '02',
                title: 'Curate discovery',
                description:
                    'Deliver the right collections, categories, and products based on intent signals.',
              ),
              ProcessCard(
                step: '03',
                title: 'Optimize flow',
                description:
                    'Remove friction and keep the shopper moving toward checkout with tailored guidance.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
