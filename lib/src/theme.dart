import 'package:flutter/material.dart';

class AppTheme {
  static const Color brandOrange = Color(0xFFFF6B00);
  static const Color brandSecondary = Color(0xFFFFB871);
  static const Color brandSurface = Color(0xFF241509);
  static const Color brandSurfaceAlt = Color(0xFF2E160A);
  static const Color brandBackground = Color(0xFF110806);
  static const Color brandMuted = Color(0xFFBFC7D7);

  static ThemeData dark() {
    return ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF6B00),
        onPrimary: Colors.white,
        secondary: Color(0xFFFFB871),
        onSecondary: Colors.black,
        surface: Color(0xFF241509),
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF110806),
      textTheme: Typography.whiteMountainView.copyWith(
        bodyLarge: const TextStyle(color: AppTheme.brandMuted, height: 1.6),
        bodyMedium: const TextStyle(color: AppTheme.brandMuted, height: 1.6),
        displayLarge: const TextStyle(
          fontSize: 56,
          fontWeight: FontWeight.w700,
          letterSpacing: -1.2,
          height: 1.0,
          color: Colors.white,
        ),
        displayMedium: const TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.w700,
          letterSpacing: -1.0,
          height: 1.05,
          color: Colors.white,
        ),
        headlineSmall: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      cardColor: const Color(0xFF241509),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: brandOrange,
          foregroundColor: Colors.white,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
      ),
    );
  }
}
