import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konekin/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Name"),
            const Text("Email"),
            const Text("Password"),
            const Text("Phone"),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Register"),
            ),
            const Text("Sudah punya akun?"),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.LOGIN),
              child: const Text("Login Page"),
            ),
          ],
        ),
      ),
    );
  }
}
