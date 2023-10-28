import 'package:flutter/material.dart';
import 'package:konekin/app/shared/theme/color.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: white,
  appBarTheme: AppBarTheme(
    backgroundColor: white,
    elevation: 0,
    foregroundColor: black,
    centerTitle: true,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.red),
    ),
  ),
);
