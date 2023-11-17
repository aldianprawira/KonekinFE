import 'package:get/get.dart';

import '../controllers/detail_video_controller.dart';

class DetailVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailVideoController>(
      () => DetailVideoController(),
    );
  }
}
