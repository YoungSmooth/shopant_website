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

  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializePlayer();
    });
  }

  void _initializePlayer() {
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
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

          SizedBox(
            width: 760,
            child: Text(
              'Explore real experiences. '
              'Watch authentic videos from businesses, using shopant you.',
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
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: List.generate(_tabs.length, (index) {
              final selected = index == _selectedIndex;

              return ChoiceChip(
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                selected: selected,
                selectedColor: Colors.white,
                backgroundColor: const Color(0xFF1A1A1A),
                side: BorderSide(
                  color: selected ? Colors.transparent : Colors.white12,
                ),
                onSelected: (_) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
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
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 40,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: const EdgeInsets.all(18),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _controller == null
                  ? const AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : YoutubePlayerScaffold(
                      controller: _controller!,
                      builder: (context, player) {
                        return AspectRatio(aspectRatio: 16 / 9, child: player);
                      },
                    ),
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
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              OutlinedButton.icon(
                onPressed: pauseVideo,
                icon: const Icon(Icons.pause),
                label: const Text('Pause'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
