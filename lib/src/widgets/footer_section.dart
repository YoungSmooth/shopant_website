import 'package:flutter/material.dart';

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
                        const Text(
                          'Shopant',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Modern commerce journeys for ambitious brands. Reduce abandonment, boost conversion, and make every shopper feel understood.',
                          style: TextStyle(
                            color: AppTheme.brandMuted,
                            fontSize: 15,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 28),
                        const FooterColumn(
                          title: 'Product',
                          items: ['Features', 'Pricing', 'Demo', 'Login'],
                        ),
                        const SizedBox(height: 20),
                        const FooterColumn(
                          title: 'Company',
                          items: ['About', 'Terms', 'Privacy', 'Contact'],
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shopant',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
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
                        FooterColumn(
                          title: 'Product',
                          items: ['Features', 'Pricing', 'Demo', 'Login'],
                        ),
                        FooterColumn(
                          title: 'Company',
                          items: ['About', 'Terms', 'Privacy', 'Contact'],
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
