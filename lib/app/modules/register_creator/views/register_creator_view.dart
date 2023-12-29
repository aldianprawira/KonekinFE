import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/theme/color.dart';
import '../controllers/register_creator_controller.dart';

class RegisterCreatorView extends GetView<RegisterCreatorController> {
  const RegisterCreatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String uid = Get.arguments["UID"];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Creator'),
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
              const Text("Bank", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              TextFormField(
                controller: controller.bankNameC,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: "Enter your bank",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your bank';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text("Bank account number", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              TextFormField(
                controller: controller.bankAccNumC,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: "Enter your bank account number",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your bank account number';
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
                        controller.registerCreator(uid);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: controller.isLoading.isFalse ? primary : Colors.grey,
                    ),
                    child: controller.isLoading.isFalse
                        ? const Text(
                            "Register",
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
