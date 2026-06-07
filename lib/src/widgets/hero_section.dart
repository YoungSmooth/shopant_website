import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';
import 'shared_widgets.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  static const _headlineText =
      'Reduce cart abandonment by 45% and 3x your sales';

  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _headingScaleAnimation;
  late final AnimationController _typewriterController;
  late final Animation<double> _typewriterProgress;
  late final Animation<Offset> _rightSlideAnimation;
  late final Animation<double> _rightFadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.18), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _headingScaleAnimation = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.35, curve: Curves.easeOutBack),
      ),
    );
    _typewriterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    _typewriterProgress = CurvedAnimation(
      parent: _typewriterController,
      curve: Curves.easeOut,
    );
    _rightSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.28), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.35, 1.0, curve: Curves.easeOutCubic),
          ),
        );
    _rightFadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.35, 1.0, curve: Curves.easeOut),
    );
    _animationController.forward();
    _typewriterController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _typewriterController.dispose();
    super.dispose();
  }

  List<TextSpan> _buildHeadlineSpans(int length) {
    final segments = [
      _HeadlineSegment('Reduce cart abandonment by ', false),
      _HeadlineSegment('45%', true),
      _HeadlineSegment(' and ', false),
      _HeadlineSegment('3x', true),
      _HeadlineSegment(' your sales', false),
    ];

    var remaining = length;
    final spans = <TextSpan>[];

    for (final segment in segments) {
      if (remaining <= 0) break;
      final text = segment.text;
      final count = remaining.clamp(0, text.length);
      spans.add(
        TextSpan(
          text: text.substring(0, count),
          style: TextStyle(
            color: segment.highlight ? AppTheme.brandOrange : Colors.white,
            fontWeight: segment.highlight ? FontWeight.w800 : FontWeight.w800,
          ),
        ),
      );
      remaining -= count;
    }

    if (length < _headlineText.length) {
      spans.add(
        TextSpan(
          text: '|',
          style: TextStyle(
            color: AppTheme.brandOrange,
            fontWeight: FontWeight.w800,
          ),
        ),
      );
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 900;
        final horizontalPadding = isNarrow ? 20.0 : 48.0;
        final headingSize = isNarrow ? 36.0 : 56.0;
        final contentSpacing = isNarrow ? 24.0 : 48.0;

        final leftContent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScaleTransition(
              scale: _headingScaleAnimation,
              child: FadeTransition(
                opacity: _headingScaleAnimation,
                child: AnimatedBuilder(
                  animation: _typewriterProgress,
                  builder: (context, _) {
                    final visibleCount =
                        (_typewriterProgress.value * _headlineText.length)
                            .clamp(0, _headlineText.length)
                            .floor();
                    return RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: headingSize,
                          fontWeight: FontWeight.w800,
                          height: 1.02,
                          color: Colors.white,
                        ),
                        children: _buildHeadlineSpans(visibleCount),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Shopant turns vague customer intent into a guided store experience, so every visitor feels understood and every flow keeps moving toward checkout.',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFCBD5E1),
                height: 1.7,
              ),
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton(
                  onPressed: () async {
                    final Uri url = Uri.parse('https://www.shopant.io/order');

                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 18,
                    ),
                    backgroundColor: AppTheme.brandOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Get Shopant',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                // OutlinedButton(
                //   onPressed: () {},
                //   style: OutlinedButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 26,
                //       vertical: 18,
                //     ),
                //     side: const BorderSide(color: Colors.white24, width: 1.5),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(14),
                //     ),
                //   ),
                //   child: const Text(
                //     'Try Shopant Live',
                //     style: TextStyle(fontSize: 16, color: Colors.white),
                //   ),
                // ),
                // TextButton.icon(
                //   onPressed: _openSampleVideo,
                //   icon: const Icon(
                //     Icons.play_circle_fill,
                //     size: 20,
                //     color: Colors.white,
                //   ),
                //   label: const Text('Watch sample'),
                //   style: TextButton.styleFrom(
                //     foregroundColor: Colors.white,
                //     backgroundColor: Colors.white12,
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 22,
                //       vertical: 18,
                //     ),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(14),
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                MiniStat(label: '45%', value: 'Lower cart abandonment'),
                MiniStat(label: '3x', value: 'Revenue velocity'),
                MiniStat(label: '30%', value: 'Conversion lift'),
              ],
            ),
          ],
        );

        final rightContent = Column(
          children: [
            HeroCard(
              label: 'Smart Search',
              title:
                  'Guides your shoppers from vague search into a curated personalized store discovery',
              footnote:
                  'Best for stores that lose sales when shoppers do not know where to start.',
              accent: AppTheme.brandSecondary,
              features: const [
                'Welcomes the shopper instantly',
                'Understands messy intent',
                'Keeps the session moving',
              ],
            ),
            const SizedBox(height: 24),
            HeroCard(
              label: 'Dynamic intent flow',
              title:
                  'Keeps sessions moving by understanding messy shopper intent and reducing dead-end browsing.',
              footnote:
                  'Routes intent signals through category intelligence and curated journeys.',
              accent: AppTheme.brandOrange,
              features: const [
                'Routes messy searches with precision',
                'Eliminates browsing dead-ends',
                'Accelerates checkout readiness',
              ],
            ),
          ],
        );

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isNarrow ? 32.0 : 40.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF110806), Color(0xFF241509)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(32),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x24000000),
                  blurRadius: 32,
                  offset: Offset(0, 20),
                ),
              ],
            ),
            padding: EdgeInsets.all(isNarrow ? 24.0 : 36.0),
            child: isNarrow
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: leftContent,
                        ),
                      ),
                      SizedBox(height: contentSpacing),
                      FadeTransition(
                        opacity: _rightFadeAnimation,
                        child: SlideTransition(
                          position: _rightSlideAnimation,
                          child: rightContent,
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: leftContent,
                          ),
                        ),
                      ),
                      SizedBox(width: contentSpacing),
                      Expanded(
                        flex: 5,
                        child: FadeTransition(
                          opacity: _rightFadeAnimation,
                          child: SlideTransition(
                            position: _rightSlideAnimation,
                            child: rightContent,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _HeadlineSegment {
  final String text;
  final bool highlight;

  const _HeadlineSegment(this.text, this.highlight);
}
