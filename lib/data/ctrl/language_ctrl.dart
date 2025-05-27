import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lang_change_app/data/userperferences/user_preferences.dart';


class LanguageCtrl extends GetxController {
  var currentLanguage = UserPreferences.instance.language.obs;

  void changeLanguage(String lang) {
    currentLanguage.value = lang;
    UserPreferences.instance.setLanguage(lang);
    Get.updateLocale(Locale(lang));
  }

  Future<Map<String, dynamic>> loadLanguageStrings(String langCode) async {
    final data = await rootBundle.loadString('assets/lang/$langCode.json');
    return json.decode(data);
  }

  Future<List<dynamic>> loadLeaders(String langCode) async {
    final data = await rootBundle.loadString('assets/lang/$langCode.json');
    final jsonData = json.decode(data);
    return jsonData['items'];
  }
}