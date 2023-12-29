import 'package:flutter/material.dart';

import '../theme/color.dart';

class LogoKonekin extends StatelessWidget {
  const LogoKonekin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: primary,
      ),
      child: Center(
        child: Text(
          "Konekin",
          style: TextStyle(
            color: white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
