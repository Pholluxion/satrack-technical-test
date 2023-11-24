import 'package:flutter/material.dart';

import 'style.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    fontFamily: 'Catamaran',
    canvasColor: AppColors.darkTertiary,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.darkSeedColor,
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      tertiary: AppColors.darkTertiary,
      background: AppColors.darkBackground,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.darkPrimary,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: AppStyles.labelMedium.copyWith(
        color: AppColors.darkTertiary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.darkPrimary,
      hintStyle: AppStyles.labelMedium.copyWith(
        color: AppColors.darkTertiary,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyles.smallRadius),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkPrimary,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyles.smallRadius),
        ),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyles.smallRadius),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: AppStyles.elevatedButtonTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: AppStyles.smallSize,
          fontFamily: 'Catamaran',
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkTertiary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.xsmallRadius),
        ),
        shadowColor: Colors.transparent,
        textStyle: AppStyles.elevatedButtonTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: AppStyles.smallSize,
          fontFamily: 'Catamaran',
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: AppStyles.headlineLarge,
      headlineMedium: AppStyles.headlineMedium,
      labelLarge: AppStyles.labelLarge,
      labelMedium: AppStyles.labelMedium,
      displayMedium: AppStyles.labelMedium,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.darkSeedColor,
      surfaceTintColor: Colors.black,
    ),
    iconTheme: const IconThemeData(
      size: AppStyles.mediumIconSize,
      color: AppColors.darkSecondary,
    ),
    snackBarTheme: SnackBarThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppStyles.mediumRadius),
          topRight: Radius.circular(AppStyles.mediumRadius),
        ),
      ),
      backgroundColor: AppColors.darkPrimary,
      actionTextColor: Colors.black,
      closeIconColor: Colors.black,
      insetPadding: AppStyles.smallPadding,
      contentTextStyle: AppStyles.labelMedium.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );

  static ThemeData light = ThemeData(
    fontFamily: 'Catamaran',
    canvasColor: AppColors.lightScaffoldBackground,
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.lightSeedColor,
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      tertiary: AppColors.lightTertiary,
      background: AppColors.lightBackground,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.lightPrimary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: AppStyles.elevatedButtonTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: AppStyles.smallSize,
          fontFamily: 'Catamaran',
        ),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: AppStyles.labelMedium.copyWith(
        color: AppColors.lightTertiary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightPrimary,
      hintStyle: AppStyles.labelMedium.copyWith(
        color: AppColors.lightTertiary,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyles.xsmallRadius),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightPrimary,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyles.xsmallRadius),
        ),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyles.xsmallRadius),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 0,
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        textStyle: AppStyles.elevatedButtonTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: AppStyles.smallSize,
          fontFamily: 'Catamaran',
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.headlineLarge,
      headlineMedium: AppStyles.headlineMedium,
      labelLarge: AppStyles.labelLarge,
      labelMedium: AppStyles.labelMedium,
      displayMedium: AppStyles.labelMedium.copyWith(
        color: Colors.black,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.lightSeedColor,
      surfaceTintColor: Colors.white,
    ),
    iconTheme: const IconThemeData(
      size: AppStyles.mediumIconSize,
      color: AppColors.darkSecondary,
    ),
    snackBarTheme: SnackBarThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppStyles.xsmallRadius),
          topRight: Radius.circular(AppStyles.xsmallRadius),
        ),
      ),
      backgroundColor: AppColors.lightPrimary,
      actionTextColor: Colors.white,
      closeIconColor: Colors.white,
      insetPadding: AppStyles.smallPadding,
      contentTextStyle: AppStyles.labelMedium.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
