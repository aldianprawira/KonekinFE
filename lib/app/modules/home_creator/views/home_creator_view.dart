import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';
import '../../../shared/widget/logo_konekin_outlined.dart';
import '../../../shared/widget/secondary_card.dart';
import '../controllers/home_creator_controller.dart';

class HomeCreatorView extends GetView<HomeCreatorController> {
  const HomeCreatorView({Key? key}) : super(key: key);
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
          print(listAllDocs);
          if (listAllDocs.isNotEmpty) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: SizedBox(
                height: Get.height,
                child: ListView.builder(
                  itemCount: listAllDocs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = listAllDocs[index].data();
                    return SecondaryCard(
                      image: data["Thumbnail"],
                      title: data["Title"],
                      creator: data["Creator"],
                      price: data["Price"],
                      bestSeller: true,
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(child: Text("Data doesn't exist"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.UPLOAD_VIDEO),
        backgroundColor: primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
