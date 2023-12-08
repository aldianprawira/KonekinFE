import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/widget/logo_konekin.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashscreenController>(
        init: SplashscreenController(),
        initState: (state) => Timer.periodic(
          const Duration(seconds: 2),
          (timer) {
            Get.toNamed(Routes.INTRODUCTION);
            timer.cancel();
          },
        ),
        builder: (controller) => const Center(
          child: LogoKonekin(),
        ),
      ),
    );
  }
}
