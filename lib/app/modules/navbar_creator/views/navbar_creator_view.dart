import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme/color.dart';
import '../../home_creator/controllers/home_creator_controller.dart';
import '../../profile_creator/controllers/profile_creator_controller.dart';
import '../controllers/navbar_creator_controller.dart';

class NavbarCreatorView extends GetView<NavbarCreatorController> {
  const NavbarCreatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeCreatorController());
    Get.put(ProfileCreatorController());
    return GetBuilder<NavbarCreatorController>(
      builder: (controller) => Scaffold(
        body: controller.page[controller.index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.index,
          onTap: (value) => controller.updateNavbar(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.forum),
              label: "Forum",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          selectedItemColor: primary,
        ),
      ),
    );
  }
}
