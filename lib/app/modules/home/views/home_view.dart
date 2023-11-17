import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konekin/app/routes/app_pages.dart';
import 'package:konekin/app/shared/theme/color.dart';
import 'package:konekin/app/shared/widget/logo_konekin_outlined.dart';
import 'package:konekin/app/shared/widget/primary_card.dart';
import 'package:konekin/app/shared/widget/recommendation_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoKonekinOutlined(),
      ),
      body: Padding(
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecommendationCard(
                      image: "assets/images/ux.jpg",
                      title: "The Ultimate UX Portfolio Course",
                      creator: "Oz Chen",
                      price: "Rp149.000,00",
                      bestSeller: true,
                      onTap: () => Get.toNamed(
                        Routes.DETAIL_VIDEO,
                        arguments: {
                          "image": "assets/images/ux.jpg",
                          "title": "The Ultimate UX Portfolio Course",
                          "bestSeller": true,
                          "creator": "Oz Chen",
                          "price": "Rp149.000,00",
                        },
                      ),
                    ),
                    RecommendationCard(
                      image: "assets/images/report.jpg",
                      title: "Crystal Reports for SAP Business One Mastery Training Course",
                      creator: "Michael Taylor",
                      price: "Rp149.000,00",
                      bestSeller: true,
                      onTap: () => Get.toNamed(
                        Routes.DETAIL_VIDEO,
                        arguments: {
                          "image": "assets/images/report.jpg",
                          "title": "Crystal Reports for SAP Business One Mastery Training Course",
                          "bestSeller": true,
                          "creator": "Michael Taylor",
                          "price": "Rp149.000,00",
                        },
                      ),
                    ),
                    RecommendationCard(
                      image: "assets/images/blender.jpg",
                      title: "Complete Blender Creator: Learn 3D Modelling for Beginners",
                      creator: "GameDev.tv Team, Rick Davidson, Grant Abbitt",
                      price: "Rp159.000,00",
                      bestSeller: true,
                    ),
                    RecommendationCard(
                      image: "assets/images/pcb.jpg",
                      title: "Crash Course Electronics and PCB Design",
                      creator: "Andre LaMothe",
                      price: "Rp149.000,00",
                      bestSeller: true,
                    ),
                    RecommendationCard(
                      image: "assets/images/medicine.jpg",
                      title: "Become a Pharmacy Technician",
                      creator: "Steven Pettit, Pharm.D.",
                      price: "Rp159.000,00",
                      bestSeller: true,
                    ),
                    RecommendationCard(
                      image: "assets/images/meeting.jpg",
                      title: "Minute Taking at Meetings",
                      creator: "Jane Watson",
                      price: "Rp149.000,00",
                      bestSeller: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
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
                      text: "Design",
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryCard(
                      image: "assets/images/pcb.jpg",
                      title: "Crash Course Electronics and PCB Design",
                      creator: "Andre LaMothe",
                      price: "Rp149.000,00",
                      bestSeller: true,
                      onTap: () => Get.toNamed(
                        Routes.DETAIL_VIDEO,
                        arguments: {
                          "image": "assets/images/pcb.jpg",
                          "title": "Crash Course Electronics and PCB Design",
                          "bestSeller": true,
                          "creator": "Andre LaMothe",
                          "price": "Rp149.000,00",
                        },
                      ),
                    ),
                    PrimaryCard(
                      image: "assets/images/blender.jpg",
                      title: "Complete Blender Creator: Learn 3D Modelling for Beginners",
                      creator: "GameDev.tv Team, Rick Davidson, Grant Abbitt",
                      price: "Rp159.000,00",
                      bestSeller: true,
                      onTap: () => Get.toNamed(
                        Routes.DETAIL_VIDEO,
                        arguments: {
                          "image": "assets/images/blender.jpg",
                          "title": "Complete Blender Creator: Learn 3D Modelling for Beginners",
                          "bestSeller": true,
                          "creator": "GameDev.tv Team, Rick Davidson, Grant Abbitt",
                          "price": "Rp159.000,00",
                        },
                      ),
                    ),
                    PrimaryCard(
                      image: "assets/images/photoshop.jpg",
                      title: "Photoshop 2022 MasterClass",
                      creator: "Martin Perhiniak",
                      price: "Rp209.000,00",
                      bestSeller: false,
                    ),
                    PrimaryCard(
                      image: "assets/images/house.jpg",
                      title: "3D House Design Mastery in Blender 3x - Grapics & Design",
                      creator: "Thomas McDonald",
                      price: "Rp149.000,00",
                      bestSeller: false,
                    ),
                    PrimaryCard(
                      image: "assets/images/ux.jpg",
                      title: "The Ultimate UX Portfolio Course",
                      creator: "Oz Chen",
                      price: "Rp149.000,00",
                      bestSeller: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
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
                      text: "Business",
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryCard(
                      image: "assets/images/meeting.jpg",
                      title: "Minute Taking at Meetings",
                      creator: "Jane Watson",
                      price: "Rp149.000,00",
                      bestSeller: true,
                    ),
                    PrimaryCard(
                      image: "assets/images/report.jpg",
                      title: "Crystal Reports for SAP Business One Mastery Training Course",
                      creator: "Michael Taylor",
                      price: "Rp149.000,00",
                      bestSeller: true,
                    ),
                    PrimaryCard(
                      image: "assets/images/teacher.jpg",
                      title: "Product Management 101",
                      creator: "Todd Birzer",
                      price: "Rp159.000,00",
                      bestSeller: false,
                    ),
                    PrimaryCard(
                      image: "assets/images/medicine.jpg",
                      title: "Become a Pharmacy Technician",
                      creator: "Steven Pettit, Pharm.D.",
                      price: "Rp159.000,00",
                      bestSeller: true,
                    ),
                    PrimaryCard(
                      image: "assets/images/engineer.jpg",
                      title: "Supervisor Leadership Skills for a Safe Workplace",
                      creator: "Marie-Claire Ross",
                      price: "Rp149.000,00",
                      bestSeller: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
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
                      text: "Development",
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryCard(
                      image: "assets/images/pcb.jpg",
                      title: "Crash Course Electronics and PCB Design",
                      creator: "Andre LaMothe",
                      price: "Rp149.000,00",
                      bestSeller: true,
                    ),
                    PrimaryCard(
                      image: "assets/images/blender.jpg",
                      title: "Complete Blender Creator: Learn 3D Modelling for Beginners",
                      creator: "GameDev.tv Team, Rick Davidson, Grant Abbitt",
                      price: "Rp159.000,00",
                      bestSeller: true,
                    ),
                    PrimaryCard(
                      image: "assets/images/photoshop.jpg",
                      title: "Photoshop 2022 MasterClass",
                      creator: "Martin Perhiniak",
                      price: "Rp209.000,00",
                      bestSeller: false,
                    ),
                    PrimaryCard(
                      image: "assets/images/house.jpg",
                      title: "3D House Design Mastery in Blender 3x - Grapics & Design",
                      creator: "Thomas McDonald",
                      price: "Rp149.000,00",
                      bestSeller: false,
                    ),
                    PrimaryCard(
                      image: "assets/images/ux.jpg",
                      title: "The Ultimate UX Portfolio Course",
                      creator: "Oz Chen",
                      price: "Rp149.000,00",
                      bestSeller: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
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
                      text: "IT & Software",
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryCard(
                      image: "assets/images/meeting.jpg",
                      title: "Minute Taking at Meetings",
                      creator: "Jane Watson",
                      price: "Rp149.000,00",
                      bestSeller: true,
                    ),
                    PrimaryCard(
                      image: "assets/images/report.jpg",
                      title: "Crystal Reports for SAP Business One Mastery Training Course",
                      creator: "Michael Taylor",
                      price: "Rp149.000,00",
                      bestSeller: true,
                    ),
                    PrimaryCard(
                      image: "assets/images/teacher.jpg",
                      title: "Product Management 101",
                      creator: "Todd Birzer",
                      price: "Rp159.000,00",
                      bestSeller: false,
                    ),
                    PrimaryCard(
                      image: "assets/images/medicine.jpg",
                      title: "Become a Pharmacy Technician",
                      creator: "Steven Pettit, Pharm.D.",
                      price: "Rp159.000,00",
                      bestSeller: true,
                    ),
                    PrimaryCard(
                      image: "assets/images/engineer.jpg",
                      title: "Supervisor Leadership Skills for a Safe Workplace",
                      creator: "Marie-Claire Ross",
                      price: "Rp149.000,00",
                      bestSeller: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
