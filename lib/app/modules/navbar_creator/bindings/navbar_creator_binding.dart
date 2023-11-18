import 'package:get/get.dart';

import '../controllers/navbar_creator_controller.dart';

class NavbarCreatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarCreatorController>(
      () => NavbarCreatorController(),
    );
  }
}
