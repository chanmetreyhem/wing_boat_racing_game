// lib/core/theme/app_text_styles.dart
import 'package:flutter/material.dart';
import 'package:wing_boat_racing_game/core/theme/app_color.dart';
import 'package:wing_boat_racing_game/core/theme/font_size.dart';

class AppTextStyles {
  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: AppSizes.display,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimaryLight,
    ),
    headlineMedium: TextStyle(
      fontSize: AppSizes.heading,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimaryLight,
    ),
    titleLarge: TextStyle(
      fontSize: AppSizes.title,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimaryLight,
    ),
    bodyLarge: TextStyle(
      fontSize: AppSizes.bodyLarge,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimaryLight,
    ),
    bodyMedium: TextStyle(
      fontSize: AppSizes.bodyMedium,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondaryLight,
    ),
  );

  // --- Dark Mode Typography Base ---
  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: lightTextTheme.displayLarge!.copyWith(
      color: AppColors.textPrimaryDark,
    ),
    headlineMedium: lightTextTheme.headlineMedium!.copyWith(
      color: AppColors.textPrimaryDark,
    ),
    titleLarge: lightTextTheme.titleLarge!.copyWith(
      color: AppColors.textPrimaryDark,
    ),
    bodyLarge: lightTextTheme.bodyLarge!.copyWith(
      color: AppColors.textPrimaryDark,
    ),
    bodyMedium: lightTextTheme.bodyMedium!.copyWith(
      color: AppColors.textSecondaryDark,
    ),
  );
}
