import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lang_change_app/constants/app_colors.dart';
import 'package:lang_change_app/constants/app_text_styles.dart';
import 'package:lang_change_app/constants/dimens.dart';
import 'package:lang_change_app/screen/leaders_screen.dart';
import 'package:lang_change_app/screen/setting_screen.dart';

import '../data/ctrl/language_ctrl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LanguageCtrl langController = Get.put(LanguageCtrl());

  void _showLanguageBottomSheet(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.primary,
      builder: (_) {
        return Container(
          padding: EdgeInsets.all(Dimens.standard_16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimens.standard_16),
                child: Text(
                  data['footer'] ?? "Select Language",
                  style: AppTextStyles.headline4.copyWith(color: AppColors.white),
                ),
              ),
              Divider(),
              ListTile(
                title: Text("English", style: AppTextStyles.headline6),
                onTap: () {
                  langController.changeLanguage("en");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("தமிழ்", style: AppTextStyles.headline6),
                onTap: () {
                  langController.changeLanguage("ta");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("हिन्दी", style: AppTextStyles.headline6),
                onTap: () {
                  langController.changeLanguage("hi");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final langCode = langController.currentLanguage.value;

      return FutureBuilder<Map<String, dynamic>>(
        future: langController.loadLanguageStrings(langCode),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: Builder(
              builder: (context) {
                return CircularProgressIndicator();
              }
            ));
          final data = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(data['home']),
              actions: [
                IconButton(
                  icon: Icon(Icons.language),
                  onPressed: () => _showLanguageBottomSheet(context, data),
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Text(data['title'], style: AppTextStyles.headline4),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(data['home'], style: AppTextStyles.headline6),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => HomeScreen());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      data['leaders'],
                      style: AppTextStyles.headline6,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => LeadersScreen());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      data['settings'],
                      style: AppTextStyles.headline6,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => SettingsScreen());
                    },
                  ),
                ],
              ),
            ),
            body: Center(
              child: Text(
                data['language'] ?? "Change Language",
                style: AppTextStyles.headline3,
              ),
            ),
          );
        },
      );
    });
  }
}
