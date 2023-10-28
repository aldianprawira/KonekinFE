import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konekin/app/shared/theme/color.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: white,
  appBarTheme: AppBarTheme(
    backgroundColor: white,
    elevation: 0,
    foregroundColor: primary,
    centerTitle: true,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(color: grey2, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(color: primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primary,
      foregroundColor: white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
);
