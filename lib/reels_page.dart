import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  final List<String> videoUrls = const [
    'https://www.pexels.com/download/video/6700011/',
    'https://www.pexels.com/download/video/5700940/',
    'https://www.pexels.com/download/video/5275554/',
    // Pwede mong dagdagan ng iba pang .mp4 links dito
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical, // Para pataas ang scroll
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          return ReelVideoPlayer(url: videoUrls[index]);
        },
      ),
    );
  }
}

// Gagawa tayo ng hiwalay na widget para sa bawat video para hindi sila mag-crash
class ReelVideoPlayer extends StatefulWidget {
  final String url;
  const ReelVideoPlayer({super.key, required this.url});

  @override
  State<ReelVideoPlayer> createState() => _ReelVideoPlayerState();
}

class _ReelVideoPlayerState extends State<ReelVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState(); // TAMA: super.initState dapat, hindi super.build
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {}); // I-refresh ang UI pag ready na ang video
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Importante ito para hindi bumagal ang phone
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. Ang Video
        _controller.value.isInitialized
            ? Center(
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        )
            : const Center(child: CircularProgressIndicator(color: Colors.white)),

        // 2. Overlay Text (Username, etc.)
        Positioned(
          bottom: 20,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@user_creator",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Check out this amazing video! 🚀 #Flutter #Reels",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}