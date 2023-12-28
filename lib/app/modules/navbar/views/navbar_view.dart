import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme/color.dart';
import '../../home/controllers/home_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    // Get.put(ForumController());
    Get.put(ProfileController());
    return GetBuilder<NavbarController>(
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
