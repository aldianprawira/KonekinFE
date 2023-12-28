import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';
import '../../../shared/widget/profile_card.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            Map<String, dynamic> userData = snapshot.data!.data()!;
            String defaultImage = "https://ui-avatars.com/api/?name=${userData['Name']}&size=1080&color=FFFFFF&background=FFA500&bold=true";
            return Stack(
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
                        radius: 60,
                        backgroundColor: white,
                        backgroundImage: NetworkImage(
                          userData["ProfilePict"] != null && userData["ProfilePict"] != "" ? userData["ProfilePict"] : defaultImage,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        userData["Name"],
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
                            onTap: () => Get.toNamed(Routes.EDIT_PROFILE, arguments: userData),
                          ),
                          ProfileCard(
                            title: "Change Password",
                            icon: Icon(Icons.key, color: primary),
                            onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD),
                          ),
                          ProfileCard(
                            title: "Switch to Creator",
                            icon: Icon(Icons.change_circle, color: primary),
                            onTap: () => userData["Role"] == "Audience" ? Get.toNamed(Routes.REGISTER_CREATOR, arguments: userData) : Get.offAllNamed(Routes.NAVBAR_CREATOR),
                          ),
                          ProfileCard(
                            title: "Help",
                            icon: Icon(Icons.help, color: primary),
                            onTap: () async {
                              final Uri url = Uri.parse("https://docs.google.com/document/d/1-XAXTJ7fhj3vXKfGuunh95WCvWixjvcrbFLdBmFL0As/edit?usp=sharing");
                              if (!await launchUrl(url)) {
                                throw Exception("Could not launch $url");
                              }
                            },
                          ),
                          ProfileCard(
                            title: "Logout",
                            icon: Icon(Icons.logout, color: primary),
                            onTap: () => controller.logout(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("Data doesn't exist."),
            );
          }
        },
      ),
    );
  }
}
