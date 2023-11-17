import 'package:get/get.dart';

import '../controllers/home_creator_controller.dart';

class HomeCreatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeCreatorController>(
      () => HomeCreatorController(),
    );
  }
}
