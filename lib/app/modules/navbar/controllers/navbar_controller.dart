import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../forum/views/forum_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

class NavbarController extends GetxController {
  List<Widget> page = [
    const HomeView(),
    const ForumView(),
    const ProfileView(),
  ];
  int index = 0;

  void updateNavbar(int value) {
    index = value;
    update();
  }
}
