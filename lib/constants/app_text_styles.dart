import 'package:flutter/material.dart';
import 'package:lang_change_app/constants/dimens.dart';

class AppTextStyles {
  static const String fontFamily = 'Poppins';

  /// headline
  static final TextStyle headline1 = TextStyle(
    fontSize: Dimens.standard_44,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: Dimens.standard_40,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: Dimens.standard_32,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle headline4 = TextStyle(
    fontSize: Dimens.standard_24,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: Dimens.standard_20,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: Dimens.standard_18,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  /// Subtitle and body
  static const TextStyle subtitle1 = TextStyle(
    fontSize: Dimens.standard_16,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: Dimens.standard_16,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: Dimens.standard_14,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static const TextStyle caption = TextStyle(
    fontSize: Dimens.standard_12,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static const TextStyle overLine = TextStyle(
    fontSize: Dimens.standard_10,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  ///  Bold versions for emphasis
  static const TextStyle button = TextStyle(
    fontSize: Dimens.standard_14,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle boldCaption = TextStyle(
    fontSize: Dimens.standard_12,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
}
