import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konekin/app/shared/theme/color.dart';

import '../controllers/video_overview_controller.dart';

class VideoOverviewView extends GetView<VideoOverviewController> {
  VideoOverviewView({Key? key}) : super(key: key);
  String image = Get.arguments["image"];
  String title = Get.arguments["title"];
  bool bestSeller = Get.arguments["bestSeller"];
  String creator = Get.arguments["creator"];
  String price = Get.arguments["price"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Overview"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: Get.width,
                height: (Get.width - 32) * 9 / 16,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus cursus augue vel eros lobortis, at semper sapien sodales. Aenean eget.",
              style: TextStyle(
                color: grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            bestSeller == true
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.lime[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "Bestseller",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: "Created by ",
                style: TextStyle(color: black),
                children: [
                  TextSpan(
                    text: creator,
                    style:
                        TextStyle(color: primary, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            const SizedBox(height: 24),
            Text(
              price,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  "Buy now",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
