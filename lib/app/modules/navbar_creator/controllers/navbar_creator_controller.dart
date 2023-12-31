import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../forum/views/forum_view.dart';
import '../../home_creator/views/home_creator_view.dart';
import '../../profile_creator/views/profile_creator_view.dart';

class NavbarCreatorController extends GetxController {
  List<Widget> page = [
    const HomeCreatorView(),
    const ForumView(),
    const ProfileCreatorView(),
  ];
  int index = 0;

  void updateNavbar(int value) {
    index = value;
    update();
  }
}
