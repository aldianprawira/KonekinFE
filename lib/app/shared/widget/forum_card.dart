import 'package:flutter/material.dart';

import '../theme/color.dart';

class ForumCard extends StatelessWidget {
  final String title;
  final String image;
  final void Function()? onTap;
  const ForumCard({
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
