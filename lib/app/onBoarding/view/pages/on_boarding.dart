import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = '/on_boarding';
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.setFullScreenListener(
      (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );

    _controller.cueVideoById(videoId: 'U_32rq7gj7E');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
