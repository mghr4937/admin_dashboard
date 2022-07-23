import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '/ui/shared/widgets/login_logo.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    try {
      _controller = VideoPlayerController.asset('login_4k.mp4')
        ..initialize().then((_) {
          setState(() {});
          _controller.setVolume(0.0);
          _controller.removeListener(() {});
          _controller.setLooping(true);
          _controller.play();
        });
      super.initState();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Transform.scale(
          scale: _calculateAspectRatio(size.aspectRatio),
          child: Center(
            child: Container(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const Text("initializing"),
            ),
          ),
        ),
        Container(
          //alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: _calculateMargin(size.height)),
          width: 400,
          color: Colors.black.withOpacity(0.5),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 5),
            const LoginLogo(),
            //const SizedBox(height: 0),
            Expanded(child: widget.child)
          ]),
        )
      ],
    ));
  }

  double _calculateAspectRatio(double aspectRatio) {
    var result = _controller.value.aspectRatio / aspectRatio;
    if (result < 1) {
      return 1.2;
    } else {
      return result;
    }
  }

  double _calculateMargin(double height) {
    if (height <= 600) {
      return 0;
    } else if (height < 700) {
      return height * 0.12;
    } else if (height < 741) {
      return height * 0.15;
    } else if (height < 821) {
      return height * 0.15;
    } else if (height <= 920) {
      return height * 0.20;
    } else if (height <= 1024) {
      return height * 0.25;
    } else {
      return height * 0.28;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    // _controller.pause();
  }
}
