import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/color.dart';

class SecondaryCard extends StatelessWidget {
  final String image;
  final String title;
  final String creator;
  final String price;
  final bool? bestSeller;
  final void Function()? onTap;
  const SecondaryCard({
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
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(image, width: 60, height: 60, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    creator,
                    style: TextStyle(fontSize: 12, color: grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
    );
  }
}
