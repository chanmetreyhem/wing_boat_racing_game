import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wing_boat_racing_game/core/theme/theme.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: GoogleFonts.googleSans().fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    textTheme: AppTextStyles.lightTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceLight,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
    ),
  );
  static ThemeData get darkTheme => ThemeData(
    fontFamily: GoogleFonts.googleSans().fontFamily,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextStyles.darkTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
    ),
  );
}
