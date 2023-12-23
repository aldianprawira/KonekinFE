import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konekin/app/routes/app_pages.dart';
import 'package:konekin/app/shared/widget/recommendation_card.dart';

import '../../../shared/theme/color.dart';
import '../../../shared/widget/logo_konekin_outlined.dart';
import '../../../shared/widget/primary_card.dart';
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
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SingleChildScrollView(
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
                      height: 282,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listAllDocs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data = listAllDocs[index].data();
                          return RecommendationCard(
                            onTap: () => Get.toNamed(Routes.VIDEO_OVERVIEW, arguments: data),
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
                    const SizedBox(height: 16),
                    _buildCourseList("Design", listAllDocs),
                    const SizedBox(height: 16),
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
    // List<QueryDocumentSnapshot<Map<String, dynamic>>> filteredDocs = [];
    // for (var doc in listAllDocs) {
    //   Map<String, dynamic> data = doc.data();
    //   if (data.containsKey('Category') && data['Category'] == category) {
    //     filteredDocs.add(doc);
    //   }
    // }
    // print("List all docs: $listAllDocs");
    // print("Filtered docs: $filteredDocs");
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
          height: 225,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredDocs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data = filteredDocs[index].data();
              return PrimaryCard(
                onTap: () => Get.toNamed(Routes.VIDEO_OVERVIEW, arguments: data),
                image: data["Thumbnail"],
                title: data["Title"],
                creator: data["Creator"],
                price: data["Price"],
                bestSeller: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
