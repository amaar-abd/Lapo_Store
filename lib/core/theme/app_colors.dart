import 'package:flutter/material.dart';

class AppColors {
  // (Main Palette)
  static const Color primaryBackground = Color(0xFF0A0E14);
  static const Color accentCyan = Color(0xFF00D2FF);
  static const Color surfaceCard = Color(0xFF1C222D);

  // (Typography)
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF94A3B8);

  // (Status)
  static const Color errorRed = Color(0xFFFF4B4B);
  static const Color successGreen = Color(0xFF00FFC2);

  // (Glassmorphism)
  static Color glassBackground = const Color(
    0xFF1C222D,
  ).withValues(alpha: 0.15);
  static Color glassBorder = const Color(0xFFFFFFFF).withValues(alpha: 0.1);
  static Color neonShadow = const Color(0xFF00D2FF).withValues(alpha: 0.4);
}
