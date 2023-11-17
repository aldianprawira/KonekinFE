import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konekin/app/shared/theme/color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/forum_controller.dart';

class ForumView extends GetView<ForumController> {
  const ForumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 4 / 3,
        children: [
          ForumCard(
            title: "Design",
            image: "assets/images/design.jpg",
            onTap: () async {
              final Uri url = Uri.parse("https://chat.whatsapp.com/J9vj37Slhd55Ilafv7Jhrb");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
          ForumCard(
            title: "Business",
            image: "assets/images/report.jpg",
          ),
          ForumCard(
            title: "Development",
            image: "assets/images/development.jpg",
          ),
          ForumCard(
            title: "IT & Software",
            image: "assets/images/it.jpg",
          ),
          ForumCard(
            title: "Personal Development",
            image: "assets/images/personalDev.jpg",
          ),
          ForumCard(
            title: "3D & Animation",
            image: "assets/images/blender.jpg",
          ),
          ForumCard(
            title: "Finance & Accounting",
            image: "assets/images/finance.jpg",
          ),
          ForumCard(
            title: "Marketing",
            image: "assets/images/marketing.jpg",
          ),
          ForumCard(
            title: "Lifestyle",
            image: "assets/images/lifestyle.jpg",
          ),
          ForumCard(
            title: "Health & Fitness",
            image: "assets/images/fitness.jpg",
          ),
          ForumCard(
            title: "Design",
            image: "assets/images/design.jpg",
          ),
          ForumCard(
            title: "Business",
            image: "assets/images/report.jpg",
          ),
          ForumCard(
            title: "Development",
            image: "assets/images/development.jpg",
          ),
          ForumCard(
            title: "IT & Software",
            image: "assets/images/it.jpg",
          ),
          ForumCard(
            title: "Personal Development",
            image: "assets/images/personalDev.jpg",
          ),
          ForumCard(
            title: "3D & Animation",
            image: "assets/images/blender.jpg",
          ),
          ForumCard(
            title: "Finance & Accounting",
            image: "assets/images/finance.jpg",
          ),
          ForumCard(
            title: "Marketing",
            image: "assets/images/marketing.jpg",
          ),
          ForumCard(
            title: "Lifestyle",
            image: "assets/images/lifestyle.jpg",
          ),
          ForumCard(
            title: "Health & Fitness",
            image: "assets/images/fitness.jpg",
          ),
        ],
      ),
    );
  }
}

class ForumCard extends StatelessWidget {
  String title;
  String image;
  void Function()? onTap;
  ForumCard({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(image),
            colorFilter: ColorFilter.mode(black.withOpacity(0.5), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
