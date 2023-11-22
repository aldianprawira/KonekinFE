import 'package:get/get.dart';

import '../controllers/video_player_ui_controller.dart';

class VideoPlayerUiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoPlayerUiController>(
      () => VideoPlayerUiController(),
    );
  }
}
