import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme/color.dart';
import '../../../shared/widget/logo_konekin_outlined.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const LogoKonekinOutlined(),
      ),
      body: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Please enter your email! We'll send a link for reset password to your email.",
                style: TextStyle(
                  color: grey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              const Text("Email", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              TextFormField(
                controller: controller.emailC,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: Get.width,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (controller.formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            controller.resetPassword(controller.emailC.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: controller.isLoading.isFalse ? primary : Colors.grey,
                        ),
                        child: controller.isLoading.isFalse
                            ? const Text(
                                "Reset Password",
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
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
