import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';
import '../../../shared/widget/logo_konekin_outlined.dart';
import '../../../shared/widget/primary_card.dart';
import '../../../shared/widget/recommendation_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoKonekinOutlined(),
      ),
      body: FutureBuilder(
        future: controller.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          List<QueryDocumentSnapshot<Map<String, dynamic>>> listAllDocs = snapshot.data!.docs;
          if (listAllDocs.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () => controller.getData(),
              child: SingleChildScrollView(
                // physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      "Recommended for you",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 289,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listAllDocs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data = listAllDocs[index].data();
                          String videoID = listAllDocs[index].id;
                          data.addAll({"VideoID": videoID});
                          return RecommendationCard(
                            onTap: () async {
                              bool transactionExists = await controller.checkTransactionExists(videoID);
                              if (transactionExists) {
                                Get.toNamed(Routes.VIDEO_PLAYER, arguments: data);
                              } else {
                                Get.toNamed(Routes.VIDEO_OVERVIEW, arguments: data);
                              }
                            },
                            image: data["Thumbnail"],
                            title: data["Title"],
                            creator: data["Creator"],
                            price: data["Price"],
                            bestSeller: true,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildCourseList("Science", listAllDocs),
                    _buildCourseList("Design", listAllDocs),
                    _buildCourseList("Health", listAllDocs),
                    _buildCourseList("Technology", listAllDocs),
                    _buildCourseList("Animation", listAllDocs),
                    _buildCourseList("Business", listAllDocs),
                    _buildCourseList("Development", listAllDocs),
                    _buildCourseList("Finance & Accounting", listAllDocs),
                    _buildCourseList("Lifestyle", listAllDocs),
                    _buildCourseList("Marketing", listAllDocs),
                    _buildCourseList("Personal Development", listAllDocs),
                    _buildCourseList("IT & Software", listAllDocs),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text("Data doesn't exist"));
          }
        },
      ),
    );
  }

  // Extract Method
  // Create a course list if listAllDosc with certain categories exist
  Widget _buildCourseList(String category, List<QueryDocumentSnapshot<Map<String, dynamic>>> listAllDocs) {
    var filteredDocs = listAllDocs.where((element) => element.data()["Category"] == category).toList();
    if (filteredDocs.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Top courses in ",
            style: TextStyle(
              color: black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: category,
                style: TextStyle(
                  color: primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 229,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredDocs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data = filteredDocs[index].data();
              String videoID = filteredDocs[index].id;
              data.addAll({"VideoID": videoID});
              return PrimaryCard(
                onTap: () async {
                  bool transactionExists = await controller.checkTransactionExists(videoID);
                  if (transactionExists) {
                    Get.toNamed(Routes.VIDEO_PLAYER, arguments: data);
                  } else {
                    Get.toNamed(Routes.VIDEO_OVERVIEW, arguments: data);
                  }
                },
                image: data["Thumbnail"],
                title: data["Title"],
                creator: data["Creator"],
                price: data["Price"],
                bestSeller: true,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
