import 'package:flutter/material.dart';
import 'package:morgan_e_commerce/core/config/theme/app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
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
