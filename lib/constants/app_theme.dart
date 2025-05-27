import 'package:flutter/material.dart';
import 'package:lang_change_app/constants/app_text_styles.dart';

import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  cardColor: AppColors.cardBackground,
  dividerColor: AppColors.divider,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.white,
    onSurface: AppColors.textPrimary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    elevation: 4,
    centerTitle: true,
    titleTextStyle: AppTextStyles.headline4
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.textPrimary),
    bodyMedium: TextStyle(color: AppColors.textSecondary),
    titleLarge: AppTextStyles.headline6,
  ),
  iconTheme: IconThemeData(color: AppColors.primaryDark),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.secondary,
    foregroundColor: AppColors.white,
  ),

);
