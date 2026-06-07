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
