import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';
import 'shared_widgets.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 760;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isNarrow ? 20.0 : 48.0,
            vertical: 42.0,
          ),
          child: Column(
            children: [
              const Divider(color: Color(0xFF3A1F0E), thickness: 1),
              const SizedBox(height: 26),
              isNarrow
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/shopant-logo.png', height: 65),
                        const SizedBox(height: 14),
                        const Text(
                          'Modern commerce journeys for ambitious brands. Reduce abandonment, boost conversion, and make every shopper feel understood.',
                          style: TextStyle(
                            color: AppTheme.brandMuted,
                            fontSize: 15,
                            height: 1.8,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/shopant-logo.png',
                                height: 65,
                              ),

                              SizedBox(height: 14),
                              Text(
                                'Modern commerce journeys for ambitious brands. Reduce abandonment, boost conversion, and make every shopper feel understood.',
                                style: TextStyle(
                                  color: AppTheme.brandMuted,
                                  fontSize: 15,
                                  height: 1.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 32),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 16,
                children: const [
                  Text(
                    '© 2026 Shopant. All rights reserved.',
                    style: TextStyle(color: AppTheme.brandMuted),
                  ),
                  Text(
                    'Built for modern brands',
                    style: TextStyle(color: AppTheme.brandMuted),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
