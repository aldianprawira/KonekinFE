import 'package:get/get.dart';

import '../controllers/upload_video_controller.dart';

class UploadVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadVideoController>(
      () => UploadVideoController(),
    );
  }
}
