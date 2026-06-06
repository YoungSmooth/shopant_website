import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const String _sampleVideoId = 'yRJy4LfwS6E';

class VideoExperienceSection extends StatefulWidget {
  const VideoExperienceSection({super.key});

  @override
  State<VideoExperienceSection> createState() => VideoExperienceSectionState();
}

class VideoExperienceSectionState extends State<VideoExperienceSection> {
  final List<String> _tabs = ['Fashion', 'Beauty', 'Electronics'];

  int _selectedIndex = 0;

  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: _sampleVideoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        mute: true,
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: true,
      ),
    );
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured discovery videos',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 24),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(controller: _controller),
            ),
          ),

          const SizedBox(height: 24),

          Wrap(
            spacing: 12,
            children: List.generate(_tabs.length, (index) {
              final selected = index == _selectedIndex;

              return ChoiceChip(
                label: Text(_tabs[index]),
                selected: selected,
                onSelected: (_) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              );
            }),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              FilledButton(onPressed: playVideo, child: const Text('Play')),
              const SizedBox(width: 12),
              OutlinedButton(onPressed: pauseVideo, child: const Text('Pause')),
            ],
          ),
        ],
      ),
    );
  }
}
