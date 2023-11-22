import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerUiView extends StatefulWidget {
  const VideoPlayerUiView({Key? key}) : super(key: key);

  @override
  State<VideoPlayerUiView> createState() => _VideoPlayerUiViewState();
}

class _VideoPlayerUiViewState extends State<VideoPlayerUiView> {
  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  String assetVideo = "assets/videos/Rivanka.mp4";
  Uri networkVideo = Uri.parse(
      "https://firebasestorage.googleapis.com/v0/b/kp-cloud-storage.appspot.com/o/Rivanka%20-%20I'm%20Not%20The%20Only%20One.mp4?alt=media&token=6624587b-ff06-4a61-979b-13eb92c9201e");

  @override
  void initState() {
    super.initState();
    // _videoPlayerController = VideoPlayerController.asset(assetVideo)
    //   ..initialize().then((value) => setState(() {}));
    _videoPlayerController = VideoPlayerController.networkUrl(networkVideo)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _videoPlayerController);
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoPlayerUiView'),
        centerTitle: true,
      ),
      body: CustomVideoPlayer(
        customVideoPlayerController: _customVideoPlayerController,
      ),
    );
  }
}
