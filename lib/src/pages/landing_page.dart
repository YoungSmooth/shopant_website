// import 'package:flutter/material.dart';

// import '../widgets/action_section.dart';
// import '../widgets/experience_section.dart';
// import '../widgets/feature_section.dart';
// import '../widgets/footer_section.dart';
// import '../widgets/hero_section.dart';
// import '../widgets/how_it_works_section.dart';
// import '../widgets/metrics_section.dart';
// import '../widgets/navigation.dart';
// import '../widgets/shared_widgets.dart';
// import '../widgets/video_experience_section.dart';

// class ShopantLandingPage extends StatefulWidget {
//   const ShopantLandingPage({super.key});

//   @override
//   State<ShopantLandingPage> createState() => _ShopantLandingPageState();
// }

// class _ShopantLandingPageState extends State<ShopantLandingPage> {
//   final ScrollController _scrollController = ScrollController();
//   final GlobalKey<VideoExperienceSectionState> _videoSectionKey =
//       GlobalKey<VideoExperienceSectionState>();
//   bool _autoLaunched = false;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_handleScroll);
//     WidgetsBinding.instance.addPostFrameCallback((_) => _handleScroll());
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_handleScroll);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _handleScroll() {
//     if (_autoLaunched) {
//       return;
//     }

//     final context = _videoSectionKey.currentContext;
//     if (context == null) {
//       return;
//     }

//     final renderBox = context.findRenderObject() as RenderBox?;
//     if (renderBox == null) {
//       return;
//     }

//     final position = renderBox.localToGlobal(Offset.zero);
//     final screenHeight = MediaQuery.of(this.context).size.height;
//     final visible =
//         position.dy < screenHeight * 0.85 &&
//         position.dy + renderBox.size.height > 0;

//     if (visible) {
//       _autoLaunched = true;
//       _videoSectionKey.currentState?.playVideo();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           controller: _scrollController,
//           child: Column(
//             children: [
//               const SectionReveal(
//                 direction: AxisDirection.down,
//                 child: TopNavigation(),
//               ),
//               const HeroSection(),
//               SectionReveal(
//                 delay: const Duration(milliseconds: 120),
//                 child: VideoExperienceSection(key: _videoSectionKey),
//               ),
//               const SectionReveal(
//                 delay: Duration(milliseconds: 220),
//                 child: MetricsStripe(),
//               ),
//               const SectionReveal(
//                 delay: Duration(milliseconds: 320),
//                 child: ExperienceSection(),
//               ),
//               const SectionReveal(
//                 delay: Duration(milliseconds: 420),
//                 child: FeatureSection(),
//               ),
//               const SectionReveal(
//                 delay: Duration(milliseconds: 520),
//                 child: HowItWorksSection(),
//               ),
//               const SectionReveal(
//                 delay: Duration(milliseconds: 620),
//                 child: ActionSection(),
//               ),
//               const SectionReveal(
//                 delay: Duration(milliseconds: 720),
//                 child: FooterSection(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../widgets/action_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/feature_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/how_it_works_section.dart';
import '../widgets/metrics_section.dart';
import '../widgets/navigation.dart';
import '../widgets/shared_widgets.dart';
import '../widgets/video_experience_section.dart';

class ShopantLandingPage extends StatelessWidget {
  const ShopantLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SectionReveal(
                direction: AxisDirection.down,
                child: TopNavigation(),
              ),

              const HeroSection(),

              const SectionReveal(
                delay: Duration(milliseconds: 120),
                child: VideoExperienceSection(),
              ),

              const SectionReveal(
                delay: Duration(milliseconds: 220),
                child: MetricsStripe(),
              ),

              const SectionReveal(
                delay: Duration(milliseconds: 320),
                child: ExperienceSection(),
              ),

              const SectionReveal(
                delay: Duration(milliseconds: 420),
                child: FeatureSection(),
              ),

              const SectionReveal(
                delay: Duration(milliseconds: 520),
                child: HowItWorksSection(),
              ),

              const SectionReveal(
                delay: Duration(milliseconds: 620),
                child: ActionSection(),
              ),

              const SectionReveal(
                delay: Duration(milliseconds: 720),
                child: FooterSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
