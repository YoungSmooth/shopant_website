import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const _sampleVideoId = 'https://www.youtube.com/watch?v=yRJy4LfwS6E';

class VideoExperienceSection extends StatefulWidget {
  const VideoExperienceSection({super.key});

  @override
  State<VideoExperienceSection> createState() => VideoExperienceSectionState();
}

class VideoExperienceSectionState extends State<VideoExperienceSection> {
  final List<String> _tabs = ['Fashion', 'Beauty', 'Electronics'];

  int _selectedIndex = 0;

  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initPlayer();
    });
  }

  void _initPlayer() {
    if (!mounted) return;

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

    setState(() {});
  }

  void playVideo() {
    _controller?.playVideo();
  }

  void pauseVideo() {
    _controller?.pauseVideo();
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
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

          if (_controller == null)
            const AspectRatio(
              aspectRatio: 16 / 9,
              child: Center(child: CircularProgressIndicator()),
            )
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: YoutubePlayerScaffold(
                controller: _controller!,
                builder: (context, player) {
                  return AspectRatio(aspectRatio: 16 / 9, child: player);
                },
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
