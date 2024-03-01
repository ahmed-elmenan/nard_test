import 'package:flutter/material.dart';
import 'package:nard_test/core/theme/styles.dart';

abstract class AppThemeData {
  static ThemeData get materialTheme {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
          background: const Color(0xFF1c1b1f),
          seedColor: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: 'Inter-Regular',
        textTheme: TextTheme(bodyMedium: Styles.labelTextStyle));
  }

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1d1d1d),
      ),
      textTheme: TextTheme(
          bodyMedium: Styles.labelTextStyle.copyWith(color: Colors.white)));

  static ThemeData get lightTheme => materialTheme.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFEDF1F4),
      ),
      scaffoldBackgroundColor: const Color(0xFFEDF1F4),
      textTheme: TextTheme(bodyMedium: Styles.labelTextStyle));
}
