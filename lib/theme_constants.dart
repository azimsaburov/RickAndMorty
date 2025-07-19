import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/color_constants.dart';

class ThemeConstants {
  static final TextTheme _lightTextTheme = TextTheme().copyWith(
    labelSmall: TextStyle(
      fontFamily: "Roboto",
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: ColorConstants.onSurface,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Roboto",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorConstants.onSurface,
    ),
    bodySmall: TextStyle(
      fontFamily: "Roboto",
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ColorConstants.onSurface,
    ),
    titleMedium: TextStyle(
      fontFamily: "Roboto",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: ColorConstants.onSurface,
    ),
    headlineLarge: TextStyle(
      fontFamily: "Roboto",
      fontSize: 34,
      fontWeight: FontWeight.w400,
      color: ColorConstants.onSurface,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Roboto",
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: ColorConstants.onSurface,
    ),
  );

  static ThemeData lightTheme = ThemeData().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorConstants.primary,
      onSurface: ColorConstants.onSurface,
    ),
    dividerColor: ColorConstants.grey4,
    disabledColor: ColorConstants.grey3,
    appBarTheme: AppBarTheme().copyWith(
      titleTextStyle: _lightTextTheme.headlineSmall,
    ),
    textTheme: _lightTextTheme,
  );
}
