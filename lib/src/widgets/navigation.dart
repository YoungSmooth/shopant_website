import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 760;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isNarrow ? 20.0 : 48.0,
            vertical: isNarrow ? 18.0 : 28.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/shopant-logo.png', height: 65),
              const Spacer(),
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(
                          'https://www.shopant.io/order',
                        );

                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.brandOrange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text('Get Shopant'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  const _NavItem(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white70,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
