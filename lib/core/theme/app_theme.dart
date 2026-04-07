import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/theme/app_typography.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    textTheme: TextTheme(
      displayLarge: AppTypography.h1,
      displayMedium: AppTypography.h2,
      displaySmall: AppTypography.h3,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelSmall: AppTypography.caption,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryBackground,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTypography.buttonText,
        backgroundColor: AppColors.accentCyan,
        foregroundColor: Colors.black,
      ),
    ),
  );
}
