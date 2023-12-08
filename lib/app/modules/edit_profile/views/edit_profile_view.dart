import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme/color.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userData = Get.arguments;
    controller.nameC.text = userData["Name"];
    controller.emailC.text = userData["Email"];
    controller.phoneC.text = userData["Phone"];
    String uid = userData["UID"];
    String defaultImage = "https://ui-avatars.com/api/?name=${userData['Name']}&size=1080&color=FFFFFF&background=FFA500&bold=true";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: GetBuilder<EditProfileController>(
        builder: (controller) => Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      controller.image != null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundColor: white,
                              backgroundImage: FileImage(File(controller.image!.path)),
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundColor: white,
                              backgroundImage: NetworkImage(
                                userData["ProfilePict"] != null && userData["ProfilePict"] != "" ? userData["ProfilePict"] : defaultImage,
                              ),
                            ),
                      TextButton(
                        onPressed: () => Get.bottomSheet(
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            height: 130,
                            color: white,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.photo),
                                  title: const Text("New profile picture", style: TextStyle(fontSize: 16)),
                                  onTap: () => controller.pickImage(),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.delete, color: Colors.red),
                                  title: const Text("Remove current picture", style: TextStyle(color: Colors.red, fontSize: 16)),
                                  onTap: () => controller.deleteProfilePict(uid),
                                ),
                              ],
                            ),
                          ),
                        ),
                        child: Text("Edit profile picture", style: TextStyle(color: primary, fontSize: 18)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Name", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                TextFormField(
                  controller: controller.nameC,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "Enter your name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text("Email", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                TextFormField(
                  controller: controller.emailC,
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: "Enter your email",
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Phone number", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                TextFormField(
                  controller: controller.phoneC,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: "Enter your phone number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: Get.width,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (controller.formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          controller.editProfile(uid);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: controller.isLoading.isFalse ? primary : Colors.grey,
                      ),
                      child: controller.isLoading.isFalse
                          ? const Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          : const Text(
                              "Loding...",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
