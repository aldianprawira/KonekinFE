import 'package:flutter/material.dart';
import 'package:konekin/app/shared/theme/color.dart';

class ProfileCard extends StatelessWidget {
  String title;
  Icon icon;
  void Function()? onTap;
  ProfileCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: primary),
            ],
          ),
        ),
      ),
    );
  }
}
