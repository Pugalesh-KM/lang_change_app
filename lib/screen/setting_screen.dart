import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lang_change_app/constants/app_text_styles.dart';
import 'package:lang_change_app/data/ctrl/language_ctrl.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final LanguageCtrl langController = Get.find<LanguageCtrl>();

  @override
  Widget build(BuildContext context) {
    final langCode = langController.currentLanguage.value;

    return FutureBuilder<Map<String, dynamic>>(
      future: langController.loadLanguageStrings(langCode),
      builder: (context, snapshot) {

        final data = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: Text(data['settings'] ?? 'Settings')),
          body: Center(
            child: Text(
              data['language'] ?? 'Language',
              style: AppTextStyles.headline3,
            ),
          ),
        );
      },
    );
  }
}
