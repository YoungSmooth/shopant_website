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
