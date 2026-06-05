import 'package:flutter/material.dart';

import '../theme.dart';
import 'shared_widgets.dart';

class MetricsStripe extends StatelessWidget {
  const MetricsStripe({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 760;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: isNarrow ? 20.0 : 48.0),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          decoration: BoxDecoration(
            color: AppTheme.brandSurface,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x24000000),
                blurRadius: 30,
                offset: Offset(0, 18),
              ),
            ],
          ),
          child: isNarrow
              ? Wrap(
                  spacing: 24,
                  runSpacing: 22,
                  children: const [
                    MetricTile(
                      title: '45%',
                      subtitle: 'Cart abandonment reduction',
                    ),
                    MetricTile(title: '3x', subtitle: 'Average revenue impact'),
                    MetricTile(
                      title: '30%',
                      subtitle: 'Conversion lift for intent search',
                    ),
                    MetricTile(
                      title: '12h',
                      subtitle: 'Fast setup for live stores',
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MetricTile(
                      title: '45%',
                      subtitle: 'Cart abandonment reduction',
                    ),
                    MetricTile(title: '3x', subtitle: 'Average revenue impact'),
                    MetricTile(
                      title: '30%',
                      subtitle: 'Conversion lift for intent search',
                    ),
                    MetricTile(
                      title: '12h',
                      subtitle: 'Fast setup for live stores',
                    ),
                  ],
                ),
        );
      },
    );
  }
}
