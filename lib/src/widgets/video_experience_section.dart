import 'package:flutter/material.dart';
import 'package:shopant_website/src/theme.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoExperienceSection extends StatefulWidget {
  const VideoExperienceSection({super.key});

  @override
  State<VideoExperienceSection> createState() => VideoExperienceSectionState();
}

class VideoExperienceSectionState extends State<VideoExperienceSection> {
  final List<String> _tabs = ['Fashion', 'Beauty', 'Electronics'];

  int _selectedIndex = 0;

  late final YoutubePlayerController _controller;

  final Map<String, String> _videoIds = {
    'Fashion': 'n0NJshpmyjQ',
    'Beauty': 'AG5asgE6VFw',
    'Electronics': 'zjj7hWZ7zc4',
  };

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: _videoIds['Fashion']!,
      autoPlay: true,
      params: const YoutubePlayerParams(
        mute: true,
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: true,
      ),
    );
  }

  void _onTabSelected(int index) {
    final tab = _tabs[index];

    setState(() {
      _selectedIndex = index;
    });

    final videoId = _videoIds[tab]!;

    // THIS is the key fix (DO NOT recreate controller)
    _controller.loadVideoById(videoId: videoId);
  }

  void playVideo() {
    _controller.playVideo();
  }

  void pauseVideo() {
    _controller.pauseVideo();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          const Text(
            'Discover Shopant in action',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 20),

          const SizedBox(
            width: 760,
            child: Text(
              'Explore real experiences. Watch authentic videos from businesses, using shopant you.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                height: 1.7,
                color: Colors.white70,
              ),
            ),
          ),

          const SizedBox(height: 40),

          Wrap(
            spacing: 12,
            children: List.generate(_tabs.length, (index) {
              final selected = index == _selectedIndex;

              return ChoiceChip(
                label: Text(
                  _tabs[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : Colors.white,
                  ),
                ),
                selected: selected,
                selectedColor: AppTheme.brandOrange,
                backgroundColor: const Color(0xFF1A1A1A),
                onSelected: (_) => _onTabSelected(index),
              );
            }),
          ),

          const SizedBox(height: 40),

          Container(
            constraints: const BoxConstraints(maxWidth: 1100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.white.withOpacity(.04),
              border: Border.all(color: Colors.white.withOpacity(.08)),
            ),
            padding: const EdgeInsets.all(18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: YoutubePlayer(controller: _controller),
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.icon(
                onPressed: playVideo,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Play'),
              ),
              const SizedBox(width: 16),
              OutlinedButton.icon(
                onPressed: pauseVideo,
                icon: const Icon(Icons.pause),
                label: const Text('Pause'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
