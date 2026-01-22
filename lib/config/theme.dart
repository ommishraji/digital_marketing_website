import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Arial',
    scaffoldBackgroundColor: const Color(0xFFF8F9FB),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF97316),
      primary: const Color(0xFFF97316),
      secondary: const Color(0xFF0E1B2C),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0E1B2C),
      ),
      headlineMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: Color(0xFF0E1B2C),
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xFF0E1B2C),
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF0E1B2C),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.6,
        color: Color(0xFF1F2937),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.6,
        color: Color(0xFF374151),
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
  );
}

class AppColors {
  static const Color primary = Color(0xFFF97316);
  static const Color secondary = Color(0xFF0E1B2C);
  static const Color accent = Color(0xFFFF6B35);
  static const Color lightAccent = Color(0xFFFF8C42);
  static const Color lightGray = Color(0xFFF8F9FB);
  static const Color gray = Color(0xFF6B7280);
  static const Color darkGray = Color(0xFF111827);
  static const Color border = Color(0xFFE5E7EB);
}
