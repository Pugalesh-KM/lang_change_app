import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  UserPreferences._();
  static final UserPreferences _instance = UserPreferences._();
  static UserPreferences get instance => _instance;

  String _language = 'en';
  String get language => _language;

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    _language = prefs.getString('language') ?? 'en';
  }

  Future<void> setLanguage(String newLanguage) async {
    _language = newLanguage;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', newLanguage);
  }
}
