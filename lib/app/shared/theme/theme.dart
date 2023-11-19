import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konekin/app/shared/theme/color.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: white,
  // brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: primary,
    // elevation: 0,
    foregroundColor: white,
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      // statusBarColor: primary,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: grey2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.red),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primary,
      foregroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
);
