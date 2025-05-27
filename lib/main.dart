import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lang_change_app/constants/app_theme.dart';
import 'package:lang_change_app/data/ctrl/language_ctrl.dart';
import 'package:lang_change_app/screen/home_screen.dart';

import 'data/userperferences/user_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.instance.loadLanguage();
  Get.put(LanguageCtrl());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Language App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: HomeScreen(),
      locale: Locale(UserPreferences.instance.language),
    );
  }
}