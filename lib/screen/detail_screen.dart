import 'package:flutter/material.dart';
import 'package:lang_change_app/constants/app_text_styles.dart';
import 'package:lang_change_app/constants/dimens.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> leader;

  const DetailScreen({super.key, required this.leader});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(leader['name'])),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.standard_16),
        child: Text(leader['detail'], style: AppTextStyles.headline6),
      ),
    );
  }
}
