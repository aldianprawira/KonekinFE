import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konekin/app/routes/app_pages.dart';
import 'package:konekin/app/shared/theme/color.dart';
import 'package:konekin/app/shared/widget/profile_card.dart';

import '../controllers/profile_creator_controller.dart';

class ProfileCreatorView extends GetView<ProfileCreatorController> {
  const ProfileCreatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backgroundProfile.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                CircleAvatar(
                  minRadius: 40,
                  backgroundColor: white,
                ),
                const SizedBox(height: 20),
                Text(
                  "Aldian Prawira",
                  style: TextStyle(
                    color: white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: Get.height * 0.7 - kBottomNavigationBarHeight,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Account settings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ProfileCard(
                      title: "Edit Profile",
                      icon: Icon(Icons.person, color: primary),
                      onTap: () => Get.toNamed(Routes.EDIT_PROFILE_CREATOR),
                    ),
                    ProfileCard(
                      title: "Switch to Audience",
                      icon: Icon(Icons.change_circle, color: primary),
                      onTap: () => Get.offAllNamed(Routes.NAVBAR),
                    ),
                    ProfileCard(
                      title: "Help",
                      icon: Icon(Icons.help, color: primary),
                    ),
                    ProfileCard(
                      title: "Logout",
                      icon: Icon(Icons.logout, color: primary),
                      onTap: () => Get.offAllNamed(Routes.REGISTER),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
