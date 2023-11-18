import 'package:get/get.dart';

import '../controllers/profile_creator_controller.dart';

class ProfileCreatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileCreatorController>(
      () => ProfileCreatorController(),
    );
  }
}
