import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/storage/preferences.dart';

final isDarkMode = StateProvider<bool>((ref) => false);

class ThemeHelper extends StateNotifier<bool> {
  final Ref ref;

  ThemeHelper(this.ref) : super(false) {
    initTheme();
  }

  Future<void> initTheme() async {
    final cachedTheme = await preferences.readBool(kThemeModeKey);

    ref.read(isDarkMode.notifier).state = cachedTheme ?? false;

    switchThemeMode();
  }

  bool get isDark => ref.read(isDarkMode);

  PreferencesStorage get preferences => ref.read(prefProvider);

  // colors region

  Color get primirayColor => isDark ? Colors.white : const Color(0xFFFF5D21);

  Color get buttonLabelColor => isDark ? Colors.black : Colors.white;

  Color get textColor => isDark ? Colors.white : const Color(0xFF2A3E4E);

  Color get textFieldPrimaryColor =>
      isDark ? const Color(0xFF3c4043) : Colors.white;

  Color get textFieldSeondaryColor =>
      isDark ? Colors.white : const Color(0xFF708DA5);

  Color get borderColor => isDark ? const Color(0xFF3c4043) : Colors.white;

  Color get dialogBackgroundColor =>
      isDark ? const Color(0xFF3c4043) : Colors.white;

  Color get indicatorDotColor =>
      isDark ? Colors.white : const Color(0xFF87a0b3);

  // end region

  void switchThemeMode() {
    ref.read(isDarkMode.notifier).state = !isDark;
    preferences.saveBool(kThemeModeKey, !isDark);
  }
}

final themeProvider = Provider<ThemeHelper>((ref) {
  return ThemeHelper(ref);
});
