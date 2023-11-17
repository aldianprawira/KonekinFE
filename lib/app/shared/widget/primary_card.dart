import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konekin/app/shared/theme/color.dart';

class PrimaryCard extends StatelessWidget {
  String image;
  String title;
  String creator;
  String price;
  bool bestSeller;
  void Function()? onTap;
  PrimaryCard({
    super.key,
    required this.image,
    required this.title,
    required this.creator,
    required this.price,
    required this.bestSeller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.4,
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: Get.width * 0.4,
                height: Get.width * 0.4 * 3 / 4,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              creator,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: TextStyle(
                color: primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            bestSeller == true
                ? Column(
                    children: [
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
