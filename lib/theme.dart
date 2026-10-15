import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Урок «Создание собственной темы приложения» (ThemeData, TextTheme, ButtonTheme, IconTheme).
class AppColors {
  static const primary = Color(0xFFFF5A36);
  static const dark = Color(0xFF1E1E2C);
  static const bg = Color(0xFFF6F6FA);
}

ThemeData buildTheme() {
  final base = ThemeData.light();
  return base.copyWith(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    textTheme: GoogleFonts.montserratTextTheme(base.textTheme).copyWith(
      headlineMedium: GoogleFonts.montserrat(
          fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.dark),
      titleLarge: GoogleFonts.montserrat(
          fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.dark),
      bodyMedium: GoogleFonts.montserrat(fontSize: 14, color: Colors.black87),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColors.dark,
      titleTextStyle: GoogleFonts.montserrat(
          fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.dark),
    ),
    iconTheme: const IconThemeData(color: AppColors.dark),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
      ),
    ),
  );
}
