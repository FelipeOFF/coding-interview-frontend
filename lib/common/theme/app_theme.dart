import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  // Color palette extracted from the UI images
  static const Color primaryOrange = Color(
    0xFFFFA726,
  ); // Bright orange from the main UI
  static const Color lightBackground = Color(
    0xFFE8F5F0,
  ); // Light mint background
  static const Color cardBackground = Color(
    0xFFF5F5F5,
  ); // Light card background
  static const Color textPrimary = Color(0xFF2E2E2E); // Dark text
  static const Color textSecondary = Color(0xFF757575); // Gray text
  static const Color accentTeal = Color(
    0xFF4DD0E1,
  ); // Teal accent from crypto icons

  static final ThemeData whiteTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: primaryOrange,
      secondary: accentTeal,
      surface: cardBackground,
      onSecondary: Colors.white,
      onSurface: textPrimary,
    ),
    scaffoldBackgroundColor: lightBackground,
    cardTheme: CardThemeData(
      color: cardBackground,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryOrange,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: textPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: textSecondary, fontSize: 14),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark(useMaterial3: true)
      .copyWith(
        colorScheme: const ColorScheme.dark(
          primary: primaryOrange,
          secondary: accentTeal,
        ),
      );
}
