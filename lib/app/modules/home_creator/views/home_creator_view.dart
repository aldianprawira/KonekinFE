import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';
import '../../../shared/widget/secondary_card.dart';
import '../controllers/home_creator_controller.dart';

class HomeCreatorView extends GetView<HomeCreatorController> {
  const HomeCreatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeCreatorView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            SecondaryCard(
              image: "assets/images/ux.jpg",
              title: "The Ultimate UX Portfolio Course",
              creator: "Oz Chen",
              price: "Rp149.000,00",
              bestSeller: true,
            ),
            SecondaryCard(
              image: "assets/images/report.jpg",
              title: "Crystal Reports for SAP Business One Mastery Training Course",
              creator: "Michael Taylor",
              price: "Rp149.000,00",
              bestSeller: true,
            ),
            SecondaryCard(
              image: "assets/images/blender.jpg",
              title: "Complete Blender Creator: Learn 3D Modelling for Beginners",
              creator: "GameDev.tv Team, Rick Davidson, Grant Abbitt",
              price: "Rp159.000,00",
              bestSeller: true,
            ),
            SecondaryCard(
              image: "assets/images/pcb.jpg",
              title: "Crash Course Electronics and PCB Design",
              creator: "Andre LaMothe",
              price: "Rp149.000,00",
              bestSeller: true,
            ),
            SecondaryCard(
              image: "assets/images/medicine.jpg",
              title: "Become a Pharmacy Technician",
              creator: "Steven Pettit, Pharm.D.",
              price: "Rp159.000,00",
              bestSeller: true,
            ),
            SecondaryCard(
              image: "assets/images/meeting.jpg",
              title: "Minute Taking at Meetings",
              creator: "Jane Watson",
              price: "Rp149.000,00",
              bestSeller: true,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.UPLOAD_VIDEO),
        backgroundColor: primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
