import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Widget> introductionItem = [
      Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: Get.height / 2,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 160),
                    Text(
                      "Chat with Awesome Creators!",
                      style: TextStyle(
                        color: primary,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: Get.width * 0.8,
                      child: Text(
                        "Meet a great creators from various profession? Only here is the place",
                        style: TextStyle(
                          color: grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 220),
              Center(
                child: Image.asset(
                  "assets/images/intro1.png",
                  width: Get.width * 0.9,
                ),
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Align(
          //         alignment: Alignment.bottomRight,
          //         child: TextButton(
          //           onPressed: () => Get.offAllNamed(Routes.REGISTER),
          //           child: Text(
          //             "Skip",
          //             style: TextStyle(color: primary, fontSize: 18),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: Get.height / 2,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 180),
                    Text(
                      "Anytime Anywhere!",
                      style: TextStyle(
                        color: primary,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: Get.width * 0.8,
                      child: Text(
                        "Are you statisfied just hearing the sound? If you chat here, you can see each other!",
                        style: TextStyle(
                          color: grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 160),
              Center(
                child: Image.asset(
                  "assets/images/intro2.png",
                  width: Get.width * 0.9,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => Get.offAllNamed(Routes.REGISTER),
                    child: Text(
                      "Next",
                      style: TextStyle(color: primary, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/backgroundIntro.png",
            width: Get.width,
            fit: BoxFit.cover,
          ),
          CarouselSlider(
            carouselController: controller.carouselC,
            items: introductionItem,
            options: CarouselOptions(
              height: Get.height,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) => controller.current.value = index,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: introductionItem.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => controller.carouselC.animateToPage(entry.key),
                    child: Obx(
                      () => Container(
                        width: 40,
                        height: 8,
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : primary).withOpacity(controller.current.value == entry.key ? 0.9 : 0.1),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              // const SizedBox(height: 28),
            ],
          ),
        ],
      ),
    );
  }
}
