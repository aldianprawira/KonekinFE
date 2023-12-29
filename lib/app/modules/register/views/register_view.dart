import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Register Account"),
      ),
      body: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 20),
              // const Text(
              //   'Register Account',
              //   style: TextStyle(
              //     fontSize: 28,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // const SizedBox(height: 16),
              const Text("Name", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              TextFormField(
                controller: controller.nameCtrl,
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
              const Text("Phone number", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              TextFormField(
                controller: controller.phoneCtrl,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
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
              const SizedBox(height: 16),
              const Text("Password", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Obx(
                () => TextFormField(
                  controller: controller.passCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
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
              const SizedBox(height: 16),
              const Text("Re-enter password", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Obx(
                () => TextFormField(
                  controller: controller.passValidationCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: controller.isHiddenConfirmPw.value,
                  decoration: InputDecoration(
                    hintText: "Re-enter your password",
                    suffixIcon: IconButton(
                      onPressed: () => controller.isHiddenConfirmPw.toggle(),
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: primary,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    } else if (value != controller.passCtrl.text) {
                      return 'Please use the same password';
                    }
                    return null;
                  },
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
                            controller.register(controller.emailCtrl.text, controller.passCtrl.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: controller.isLoading.isFalse ? primary : Colors.grey,
                        ),
                        child: controller.isLoading.isFalse
                            ? const Text(
                                "Register",
                                style: TextStyle(fontSize: 20),
                              )
                            : const Text(
                                "Loading...",
                                style: TextStyle(fontSize: 20),
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
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: Text(
                      "Login here",
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
