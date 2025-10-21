import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: getTextTheme(),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.primaryColor,
      secondary: Colors.grey.shade200,
      onSecondary: Colors.grey.shade200,
      error: AppColors.red,
      onError: AppColors.red,
      surface: Colors.white,
      onSurface: AppColors.dark,
      surfaceTint: Colors.white,
    ),
  );
}

TextTheme? getTextTheme() {
  final currentLanguageCode =  "en" ; //ConfigLocalDataSource.getLanguageCode();

  const textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.dark,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.dark,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.dark,
    ),
    bodyLarge: TextStyle(
      fontSize: 22,
      color: AppColors.dark,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: AppColors.dark,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: AppColors.dark,
    ),
  );
  switch (currentLanguageCode) {
    case 'en':
      return GoogleFonts.poppinsTextTheme(textTheme);
    case 'ar':
      return GoogleFonts.cairoTextTheme(textTheme);
    default:
      return GoogleFonts.poppinsTextTheme(textTheme);
  }
}
