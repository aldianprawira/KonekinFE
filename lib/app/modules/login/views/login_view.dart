import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Email"),
            const Text("Password"),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.HOME),
              child: const Text("Login"),
            ),
            const Text("Belum punya akun?"),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text("Register Page"),
            ),
          ],
        ),
      ),
    );
  }
}
