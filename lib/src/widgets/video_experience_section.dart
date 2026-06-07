// import 'package:flutter/material.dart';
// import 'package:shopant_website/src/theme.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// class VideoExperienceSection extends StatefulWidget {
//   const VideoExperienceSection({super.key});

//   @override
//   State<VideoExperienceSection> createState() => VideoExperienceSectionState();
// }

// class VideoExperienceSectionState extends State<VideoExperienceSection> {
//   final List<String> _tabs = ['Fashion', 'Beauty', 'Electronics'];

//   int _selectedIndex = 0;

//   late final YoutubePlayerController _controller;
//   // https://youtu.be/cvJY3a7qcbQ?si=ZoFZDY-nHryWNxkD
//   final Map<String, String> _videoIds = {
//     'Fashion': 'cvJY3a7qcbQ',
//     'Beauty': 'AG5asgE6VFw',
//     'Electronics': 'zjj7hWZ7zc4',
//   };

//   @override
//   void initState() {
//     super.initState();

//     _controller = YoutubePlayerController.fromVideoId(
//       videoId: _videoIds['Fashion']!,
//       autoPlay: true,
//       params: const YoutubePlayerParams(
//         mute: true,
//         showControls: true,
//         showFullscreenButton: true,
//         strictRelatedVideos: true,
//       ),
//     );
//   }

//   void _onTabSelected(int index) {
//     final tab = _tabs[index];

//     setState(() {
//       _selectedIndex = index;
//     });

//     final videoId = _videoIds[tab]!;

//     // THIS is the key fix (DO NOT recreate controller)
//     _controller.loadVideoById(videoId: videoId);
//   }

//   void playVideo() {
//     _controller.playVideo();
//   }

//   void pauseVideo() {
//     _controller.pauseVideo();
//   }

//   @override
//   void dispose() {
//     _controller.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//       child: Column(
//         children: [
//           const Text(
//             'Discover Shopant in action',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 52,
//               fontWeight: FontWeight.w800,
//               color: Colors.white,
//               height: 1.1,
//             ),
//           ),

//           const SizedBox(height: 20),

//           const SizedBox(
//             width: 760,
//             child: Text(
//               'Explore real experiences. Watch authentic videos from businesses, using shopant.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18,
//                 height: 1.7,
//                 color: Colors.white70,
//               ),
//             ),
//           ),

//           const SizedBox(height: 40),

//           Wrap(
//             spacing: 12,
//             children: List.generate(_tabs.length, (index) {
//               final selected = index == _selectedIndex;

//               return ChoiceChip(
//                 label: Text(
//                   _tabs[index],
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: selected ? Colors.white : Colors.white,
//                   ),
//                 ),
//                 selected: selected,
//                 selectedColor: AppTheme.brandOrange,
//                 backgroundColor: const Color(0xFF1A1A1A),
//                 onSelected: (_) => _onTabSelected(index),
//               );
//             }),
//           ),

//           const SizedBox(height: 40),

//           Container(
//             constraints: const BoxConstraints(maxWidth: 1100),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(28),
//               color: Colors.white.withOpacity(.04),
//               border: Border.all(color: Colors.white.withOpacity(.08)),
//             ),
//             padding: const EdgeInsets.all(18),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: YoutubePlayer(controller: _controller),
//             ),
//           ),

//           const SizedBox(height: 30),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               FilledButton.icon(
//                 onPressed: playVideo,
//                 icon: const Icon(Icons.play_arrow),
//                 label: const Text('Play'),
//               ),
//               const SizedBox(width: 16),
//               OutlinedButton.icon(
//                 onPressed: pauseVideo,
//                 icon: const Icon(Icons.pause),
//                 label: const Text('Pause'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

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

  final Map<String, String> _videoIds = {
    'Fashion': 'cvJY3a7qcbQ',
    'Beauty': 'AG5asgE6VFw',
    'Electronics': 'zjj7hWZ7zc4',
  };

  String get _currentVideoId => _videoIds[_tabs[_selectedIndex]]!;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openVideoPlayer() {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.85),
      builder: (context) {
        final controller = YoutubePlayerController.fromVideoId(
          videoId: _currentVideoId,
          autoPlay: true,
          params: const YoutubePlayerParams(
            showControls: true,
            showFullscreenButton: true,
            mute: false,
          ),
        );

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              // Click outside area
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(color: Colors.transparent),
              ),

              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // HEADER BAR
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const Spacer(),

                            const Text(
                              'Close',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(width: 12),

                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // VIDEO
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: YoutubePlayer(controller: controller),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
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
              'Explore real experiences before visiting. Watch how businesses use Shopant in real life.',
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
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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

          // PREVIEW CARD
          GestureDetector(
            onTap: _openVideoPlayer,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Colors.white.withOpacity(.04),
                border: Border.all(color: Colors.white.withOpacity(.08)),
              ),
              padding: const EdgeInsets.all(18),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      'https://img.youtube.com/vi/$_currentVideoId/maxresdefault.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),

                    Container(color: Colors.black.withOpacity(0.35)),

                    const Icon(
                      Icons.play_circle_fill,
                      size: 80,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          FilledButton.icon(
            onPressed: _openVideoPlayer,
            icon: const Icon(Icons.play_arrow),
            label: const Text('Play Video'),
          ),
        ],
      ),
    );
  }
}
