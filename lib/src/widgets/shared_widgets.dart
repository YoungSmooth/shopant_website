import 'package:flutter/material.dart';

import '../theme.dart';

class SectionReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final AxisDirection direction;

  const SectionReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.direction = AxisDirection.up,
  });

  @override
  State<SectionReveal> createState() => _SectionRevealState();
}

class _SectionRevealState extends State<SectionReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 620),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: _offsetForDirection(widget.direction),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (!mounted) return;
        _controller.forward();
      });
    }
  }

  Offset _offsetForDirection(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 0.14);
      case AxisDirection.down:
        return const Offset(0, -0.14);
      case AxisDirection.left:
        return const Offset(0.14, 0);
      case AxisDirection.right:
        return const Offset(-0.14, 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}

class MiniStat extends StatelessWidget {
  final String label;
  final String value;

  const MiniStat({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: BoxDecoration(
        color: AppTheme.brandSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF3A1F0E)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 22,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 15, color: AppTheme.brandMuted),
          ),
        ],
      ),
    );
  }
}

class HeroCard extends StatelessWidget {
  final String label;
  final String title;
  final String footnote;
  final Color accent;
  final List<String>? features;

  const HeroCard({
    super.key,
    required this.label,
    required this.title,
    required this.footnote,
    required this.accent,
    this.features,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [accent.withAlpha(80), const Color(0xFF140A05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: const Color(0xFF3A1F0E)),
        ),
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: accent.withAlpha(45),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                label.toUpperCase(),
                style: TextStyle(
                  color: accent,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1.35,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              footnote,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFFCBD5E1),
                height: 1.75,
              ),
            ),
            if (features != null) ...[
              const SizedBox(height: 22),
              for (int i = 0; i < features!.length; i++) ...[
                _FeatureListItem(text: features![i]),
                if (i < features!.length - 1) const SizedBox(height: 10),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

class _FeatureListItem extends StatelessWidget {
  final String text;
  const _FeatureListItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Color(0xFF4ADE80), size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 15, color: Color(0xFFCBD5E1)),
          ),
        ),
      ],
    );
  }
}

class MetricTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const MetricTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 15, color: AppTheme.brandMuted),
        ),
      ],
    );
  }
}

class ExperienceBadge extends StatelessWidget {
  final String label;
  const ExperienceBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      backgroundColor: AppTheme.brandSurface,
      side: const BorderSide(color: Color(0xFF3A1F0E)),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
    );
  }
}

class SelectedExperienceCard extends StatelessWidget {
  final String title;
  final String description;
  final String tag;

  const SelectedExperienceCard({
    super.key,
    required this.title,
    required this.description,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.brandSurface,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 28,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tag.toUpperCase(),
            style: const TextStyle(
              color: AppTheme.brandMuted,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: AppTheme.brandMuted,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 24),
          const _CardMetric(
            label: 'Works best when',
            value: 'the shopper starts vague',
          ),
          const _CardMetric(
            label: 'Primary lift',
            value: 'better product direction',
          ),
          const _CardMetric(
            label: 'Sales effect',
            value: 'increases conversion by 30%',
          ),
          const _CardMetric(
            label: 'Store effect',
            value: 'less dead-end browsing',
          ),
        ],
      ),
    );
  }
}

class _CardMetric extends StatelessWidget {
  final String label;
  final String value;

  const _CardMetric({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppTheme.brandOrange,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$label: $value',
              style: const TextStyle(fontSize: 15, color: AppTheme.brandMuted),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedExperienceChart extends StatelessWidget {
  const SelectedExperienceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF140A05), Color(0xFF241509)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Positioned(
            top: 24,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Real time shopper journey map',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'Capture intent, route to the right collection, and reduce browsing friction with intelligent discovery.',
                  style: TextStyle(
                    color: AppTheme.brandMuted,
                    fontSize: 14,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _JourneyChip(label: 'Search starts broad'),
                SizedBox(height: 16),
                _JourneyStripe(label: 'Matched categories', value: '95%'),
                SizedBox(height: 10),
                _JourneyStripe(
                  label: 'Warm leads through discovery',
                  value: '78%',
                ),
                SizedBox(height: 10),
                _JourneyStripe(label: 'Drop-offs eliminated', value: '64%'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _JourneyChip extends StatelessWidget {
  final String label;
  const _JourneyChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _JourneyStripe extends StatelessWidget {
  final String label;
  final String value;
  const _JourneyStripe({required this.label, required this.value});

  double get _widthFactor {
    final numeric = double.tryParse(value.replaceAll('%', '').trim()) ?? 0;
    return numeric.clamp(5, 100) / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: const TextStyle(
              color: AppTheme.brandMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 5,
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              color: const Color(0xFF3A1F0E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: _widthFactor,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.brandOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 42,
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class FeatureCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _isHovered = false;

  void _onEnter(PointerEvent event) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit(PointerEvent event) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _isHovered
        ? AppTheme.brandOrange
        : const Color(0xFF3A1F0E);
    final cardColor = _isHovered
        ? AppTheme.brandSurfaceAlt
        : AppTheme.brandSurface;
    final iconBackground = _isHovered
        ? AppTheme.brandOrange.withValues(alpha: 0.18)
        : const Color(0xFF3A1F0E);

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: borderColor,
              width: _isHovered ? 1.8 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: borderColor.withValues(alpha: _isHovered ? 0.14 : 0.08),
                blurRadius: _isHovered ? 28 : 18,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(widget.icon, size: 28, color: AppTheme.brandOrange),
              ),
              const SizedBox(height: 24),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppTheme.brandMuted,
                  height: 1.75,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.brandOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProcessCard extends StatelessWidget {
  final String step;
  final String title;
  final String description;

  const ProcessCard({
    super.key,
    required this.step,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppTheme.brandSurface,
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Center(
              child: Text(
                step,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              color: AppTheme.brandMuted,
              height: 1.75,
            ),
          ),
        ],
      ),
    );
  }
}

class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterColumn({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                item,
                style: const TextStyle(
                  color: AppTheme.brandMuted,
                  fontSize: 15,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
