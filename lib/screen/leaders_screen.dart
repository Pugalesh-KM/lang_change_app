import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lang_change_app/constants/app_text_styles.dart';
import 'package:lang_change_app/constants/dimens.dart';
import 'package:lang_change_app/data/ctrl/language_ctrl.dart';
import 'package:lang_change_app/screen/detail_screen.dart';

class LeadersScreen extends StatefulWidget {
   const LeadersScreen({super.key});

  @override
  State<LeadersScreen> createState() => _LeadersScreenState();
}

class _LeadersScreenState extends State<LeadersScreen> {
  final langController = Get.find<LanguageCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final langCode = langController.currentLanguage.value;

      return FutureBuilder<Map<String, dynamic>>(
        future: langController.loadLanguageStrings(langCode),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final languageData = snapshot.data!;

          return FutureBuilder<List<dynamic>>(
            future: langController.loadLeaders(langCode),
            builder: (context, leadersSnapshot) {
              if (!leadersSnapshot.hasData) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              final leaders = leadersSnapshot.data!;
              return Scaffold(
                appBar: AppBar(
                  title: Text(languageData['leaders'] ?? 'Leaders'),
                ),
                body: GridView.builder(
                  padding: const EdgeInsets.all(Dimens.standard_10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: leaders.length,
                  itemBuilder: (context, index) {
                    final leader = leaders[index];
                    return GestureDetector(
                      onTap: () => Get.to(() => DetailScreen(leader: leader)),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.standard_12)),
                        child: Center(
                          child: Text(
                            leader['name'] ?? 'Unknown',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.headline6,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      );
    });
  }
}
