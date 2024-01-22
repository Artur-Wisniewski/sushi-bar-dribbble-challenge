import 'package:flutter/material.dart';

import 'colors.dart';

final mainTheme = ThemeData(
  fontFamily: 'NotoSansJP',
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  primaryColor: AppColors.primary,
  textTheme: const TextTheme().copyWith(
    displayLarge: const TextStyle(
      fontSize: 48,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: const TextStyle(
      color: Colors.black,
      height: 1.4,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: const TextStyle(
      fontSize: 36,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 15,
    ),
    bodySmall: const TextStyle(
      fontSize: 14,
      color: Colors.white60,
    ),
    headlineMedium: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: const TextStyle(
      color: Colors.black,
      height: 1.4,
      fontSize: 17,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    displaySmall: const TextStyle(
      fontSize: 36,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: const TextStyle(
      fontSize: 14,
      color: Colors.grey,
      fontWeight: FontWeight.w600,
    ),
    labelLarge: const TextStyle(
      fontSize: 12,
      color: Colors.grey,
      fontWeight: FontWeight.w400,
    ),
  ),
);
