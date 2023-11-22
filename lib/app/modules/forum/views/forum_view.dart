import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konekin/app/shared/widget/forum_card.dart';
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
              final Uri url =
                  Uri.parse("https://chat.whatsapp.com/CGqXR30pKh2HbYmCJfV0Om");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
          ForumCard(
            title: "Business",
            image: "assets/images/report.jpg",
            onTap: () async {
              final Uri url =
                  Uri.parse("https://chat.whatsapp.com/InVMgffSDAy75EUvRyVl18");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
          ForumCard(
            title: "Development",
            image: "assets/images/development.jpg",
            onTap: () async {
              final Uri url =
                  Uri.parse("https://chat.whatsapp.com/KX0Yuw0WaBG1UGQ5MGaQOM");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
          ForumCard(
            title: "IT & Software",
            image: "assets/images/it.jpg",
            onTap: () async {
              final Uri url =
                  Uri.parse("https://chat.whatsapp.com/HP15qezfnqiKxYcmUF6V8s");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
          ForumCard(
            title: "Personal Development",
            image: "assets/images/personalDev.jpg",
            onTap: () async {
              final Uri url =
                  Uri.parse("https://chat.whatsapp.com/H8UZQcg7xcXJcjbSQz2K2j");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
          ForumCard(
            title: "3D & Animation",
            image: "assets/images/blender.jpg",
            onTap: () async {
              final Uri url =
                  Uri.parse("https://chat.whatsapp.com/G3he87Tu1nI7GT9t0ddMMv");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
          ForumCard(
            title: "Finance & Accounting",
            image: "assets/images/finance.jpg",
            onTap: () async {
              final Uri url =
                  Uri.parse("https://chat.whatsapp.com/HV2UmmouNYE4iL1lzfy2ip");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
          ForumCard(
            title: "Marketing",
            image: "assets/images/marketing.jpg",
            onTap: () async {
              final Uri url =
                  Uri.parse("https://chat.whatsapp.com/I1HOKZxNonW8VzLpph6tHf");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
          ForumCard(
            title: "Lifestyle",
            image: "assets/images/lifestyle.jpg",
            onTap: () async {
              final Uri url =
                  Uri.parse("https://chat.whatsapp.com/CM0kihPeEtl06kb62HXe9S");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
          ForumCard(
            title: "Health & Fitness",
            image: "assets/images/fitness.jpg",
            onTap: () async {
              final Uri url =
                  Uri.parse("https://chat.whatsapp.com/LqulRRfa6Dh4ZAo2r7y2DN");
              if (!await launchUrl(url)) {
                throw Exception("Could not launch $url");
              }
            },
          ),
        ],
      ),
    );
  }
}
