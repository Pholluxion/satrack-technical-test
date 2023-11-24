import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences preferencesModule;

  SharedPreferencesService(this.preferencesModule);

  Future<bool> setString(String key, String value) async {
    final SharedPreferences preferences = preferencesModule;
    return await preferences.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final SharedPreferences preferences = preferencesModule;
    return preferences.getString(key);
  }

  Future<bool> setBool(String key, bool value) async {
    final SharedPreferences preferences = preferencesModule;
    return await preferences.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final SharedPreferences preferences = preferencesModule;
    return preferences.getBool(key);
  }

  Future<bool> setInt(String key, int value) async {
    final SharedPreferences preferences = preferencesModule;
    return await preferences.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final SharedPreferences preferences = preferencesModule;
    return preferences.getInt(key);
  }

  Future<bool> setDouble(String key, double value) async {
    final SharedPreferences preferences = preferencesModule;
    return await preferences.setDouble(key, value);
  }

  Future<double?> getDouble(String key) async {
    final SharedPreferences preferences = preferencesModule;
    return preferences.getDouble(key);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    final SharedPreferences preferences = preferencesModule;
    return await preferences.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    final SharedPreferences preferences = preferencesModule;
    return preferences.getStringList(key);
  }

  Future<bool> containsKey(String key) async {
    final SharedPreferences preferences = preferencesModule;
    return preferences.containsKey(key);
  }

  Future<bool> remove(String key) async {
    final SharedPreferences preferences = preferencesModule;
    return await preferences.remove(key);
  }

  Future<bool> clear() async {
    final SharedPreferences preferences = preferencesModule;
    return await preferences.clear();
  }
}
