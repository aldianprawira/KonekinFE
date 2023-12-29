import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/theme/color.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Current password", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Obx(
                () => TextFormField(
                  controller: controller.currentPassC,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  obscureText: controller.isHidden.value,
                  decoration: InputDecoration(
                    hintText: "Enter your current password",
                    suffixIcon: IconButton(
                      onPressed: () => controller.isHidden.toggle(),
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: primary,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text("New password", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Obx(
                () => TextFormField(
                  controller: controller.newPassC,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  obscureText: controller.isHidden2.value,
                  decoration: InputDecoration(
                    hintText: "Enter your new password",
                    suffixIcon: IconButton(
                      onPressed: () => controller.isHidden2.toggle(),
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: primary,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your new password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text("Re-enter new password", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Obx(
                () => TextFormField(
                  controller: controller.newPassValidationC,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: controller.isHidden3.value,
                  decoration: InputDecoration(
                    hintText: "Re-enter your new password",
                    suffixIcon: IconButton(
                      onPressed: () => controller.isHidden3.toggle(),
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: primary,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your new password';
                    } else if (value != controller.newPassC.text) {
                      return 'Please use the same password';
                    }
                    return null;
                  },
                ),
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
                        controller.changePassword();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: controller.isLoading.isFalse ? primary : Colors.grey,
                    ),
                    child: controller.isLoading.isFalse
                        ? const Text(
                            "Change",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        : const Text(
                            "Loading...",
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
    );
  }
}
