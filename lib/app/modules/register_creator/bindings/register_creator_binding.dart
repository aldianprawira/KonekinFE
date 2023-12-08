import 'package:get/get.dart';

import '../controllers/register_creator_controller.dart';

class RegisterCreatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCreatorController>(
      () => RegisterCreatorController(),
    );
  }
}
