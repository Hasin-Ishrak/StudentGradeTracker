
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF2E6F40),      
      onPrimary: Color(0xFFFFFFFF),     
      secondary: Color(0xFFCB997E),     
      onSecondary: Color(0xFF2B2118),
      surface: Color(0xFFFFF8EF),       
      onSurface: Color(0xFF2B2118),     
      error: Color(0xFFB3261E),
      onError: Color(0xFFFFFFFF),
      outline: Color(0xFFB8A98D),
    ),
    scaffoldBackgroundColor: const Color(0xFFFCF3E3),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2E6F40),
      foregroundColor: Color(0xFFFFFFFF),
      elevation: 2,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2B2118)),
      bodyMedium: TextStyle(color: Color(0xFF2B2118)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2E6F40),
        foregroundColor: const Color(0xFFFFFFFF),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFFFFF8EF),
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFFFF8EF),
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFFF8EF),
      selectedItemColor: Color(0xFF2E6F40),
      unselectedItemColor: Color(0xFF9C8E76),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF2DD4BF),       
      onPrimary: Color(0xFF02211F),
      secondary: Color(0xFF7C3AED),     
      onSecondary: Color(0xFFF3E8FF),
      surface: Color(0xFF1A1A2E),       
      onSurface: Color(0xFFE4E4F0),
      error: Color(0xFFFF6B6B),
      onError: Color(0xFF2B0000),
      outline: Color(0xFF4A4A6A),
    ),
    scaffoldBackgroundColor: const Color(0xFF12121E),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1A2E),
      foregroundColor: Color(0xFF2DD4BF),
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFE4E4F0)),
      bodyMedium: TextStyle(color: Color(0xFFE4E4F0)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2DD4BF),
        foregroundColor: const Color(0xFF02211F),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFF1A1A2E),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1A1A2E),
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1A1A2E),
      selectedItemColor: Color(0xFF2DD4BF),
      unselectedItemColor: Color(0xFF6B6B8A),
    ),
  );
}