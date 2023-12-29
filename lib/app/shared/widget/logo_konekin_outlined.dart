import 'package:flutter/material.dart';

import '../theme/color.dart';

class LogoKonekinOutlined extends StatelessWidget {
  const LogoKonekinOutlined({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: white, width: 2),
      ),
      child: Center(
        child: Text(
          "Konekin",
          style: TextStyle(
            color: white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
