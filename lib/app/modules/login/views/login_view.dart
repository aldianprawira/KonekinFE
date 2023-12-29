import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';
import '../../../shared/widget/logo_konekin_outlined.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
                'Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "You've been missed, please enter your email and your password.",
                style: TextStyle(
                  color: grey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              const Text("Email", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              TextFormField(
                controller: controller.emailCtrl,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
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
              const SizedBox(height: 16),
              const Text("Password", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Obx(
                () => TextFormField(
                  controller: controller.passCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: controller.isHiddenPw.value,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      onPressed: () => controller.isHiddenPw.toggle(),
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: primary,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
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
                            controller.login(controller.emailCtrl.text, controller.passCtrl.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: controller.isLoading.isFalse ? primary : Colors.grey,
                        ),
                        child: controller.isLoading.isFalse
                            ? const Text(
                                "Login",
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
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account yet?"),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      "Register here",
                      style: TextStyle(
                        color: primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
