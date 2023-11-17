import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konekin/app/modules/forum/views/forum_view.dart';
import 'package:konekin/app/modules/home/views/home_view.dart';
import 'package:konekin/app/modules/profile/views/profile_view.dart';

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
