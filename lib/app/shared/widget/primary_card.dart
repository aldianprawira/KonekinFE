import 'package:flutter/material.dart';

import '../theme/color.dart';

class PrimaryCard extends StatelessWidget {
  final String image;
  final String title;
  final String creator;
  final String price;
  final bool bestSeller;
  final void Function()? onTap;
  const PrimaryCard({
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
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                width: 160,
                height: 160 * 3 / 4,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              maxLines: 2,
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
