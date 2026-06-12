// lib/core/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand colors
  static const Color primary = Color(0xFF6200EE);
  static const Color secondary = Color(0xFF03DAC6);

  // Light Theme palette
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceLight = Colors.white;
  static const Color textPrimaryLight = Color(0xFF212121);
  static const Color textSecondaryLight = Color(0xFF757575);

  // Dark Theme palette
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color textPrimaryDark = Color.fromARGB(255, 255, 255, 255);
  static const Color textSecondaryDark = Color(0xFF757575);

  static const Color goldPrimary = Color(
    0xFFE5B842,
  ); // Main Khmer ornament gold
  static const Color goldAccent = Color(0xFFFFF1A8); // Highlight/Glow gold
  static const Color goldDark = Color(0xFF9E7A1D); // Shadow/Border gold

  // --- Theme Backgrounds (River & Night Sky) ---
  static const Color deepBlueDark = Color(
    0xFF0F1A2C,
  ); // Deep night sky background
  static const Color riverBlueDark = Color(
    0xFF13253B,
  ); // Panel background (Dark)
  static const Color riverBlueLight = Color(
    0xFFEBF1F6,
  ); // Soft sky tint (Light)
  //static const Color surfaceLight = Color(0xFFFFFFFF);   // Pure white for panels

  // --- UI Elements & Accents ---
  static const Color buttonGreen = Color(0xFF6BB836); // "PLAY" / "SUBMIT" Green
  static const Color rhythmCyan = Color(
    0xFF26E6C7,
  ); // "PERFECT" rhythm meter cyan
  static const Color textDark = Color(
    0xFF1A1A1A,
  ); // Readable text for light mode
  static const Color textLight = Color(
    0xFFF5F5F5,
  ); // Readable text for dark mode
  static const Color textMuted = Color(0xFF8A9BB0);
}
