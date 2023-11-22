import 'package:get/get.dart';

import '../controllers/video_overview_controller.dart';

class VideoOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoOverviewController>(
      () => VideoOverviewController(),
    );
  }
}
