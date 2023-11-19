import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konekin/app/shared/theme/color.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());
    // Get.put(ForumController());
    return GetBuilder<NavbarController>(
      builder: (controller) => Scaffold(
        body: controller.page[controller.index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.index,
          onTap: (value) => controller.updateNavbar(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
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
