import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = 'themeMode';

class PreferencesStorage {
  SharedPreferences? _prefs;

  PreferencesStorage() {
    initStorage();
  }

  Future<void> initStorage() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveBool(String key, bool value) async {
    try {
      await _prefs?.setBool(key, value);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> readBool(String key) async {
     final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<void> deleteBool(String key) async {
    await _prefs?.remove(key);
  }
}

final prefProvider = Provider<PreferencesStorage>((_) {
  return PreferencesStorage();
});
