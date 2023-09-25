import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konekin/app/routes/app_pages.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashscreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.offAllNamed(Routes.INTRODUCTION),
          child: const Text("Introduction Screen"),
        ),
      ),
    );
  }
}