import 'package:get/get.dart';

import '../controllers/edit_profile_creator_controller.dart';

class EditProfileCreatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileCreatorController>(
      () => EditProfileCreatorController(),
    );
  }
}
