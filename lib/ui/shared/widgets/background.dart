import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Background extends StatefulWidget {
  const Background({Key? key}) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://assets.mixkit.co/videos/download/mixkit-football-soccer-field-9660-medium.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var width;
    if (size.width <= 1200) {
      width = size.width * 0.3;
    } else if (size.width <= 1500) {
      width = size.width * 0.5;
    } else {
      width = size.width * 0.6;
    }
    return SizedBox(
        width: width,
        //constraints: const BoxConstraints(maxWidth: 400),
        child: VideoPlayer(_controller));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  BoxDecoration _buildBackgroundImage() {
    return const BoxDecoration(image: DecorationImage(image: AssetImage('assets/background.png'), fit: BoxFit.cover));
  }
}
