import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color lightSeedColor = Color(0xff1B85F3);
  static const Color lightPrimary = Color(0xff1B85F3);
  static const Color lightSecondary = Color(0XFF1B85F3);
  static const Color lightTertiary = Color(0xFF808B9A);
  static const Color lightBackground = Color(0xFFE7EDF5);
  static const Color lightScaffoldBackground = Color(0xFFE7EDF5);

  static const Color darkSeedColor = Color(0xff1B85F3);
  static const Color darkPrimary = Color(0xff1B85F3);
  static const Color darkSecondary = Color(0xFFADADAD);
  static const Color darkTertiary = Color(0xFF4A4A4A);
  static const Color darkBackground = Color(0xFF222222);
  static const Color darkScaffoldBackground = Color(0xFF222222);

  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyDark = Color(0xFF424242);
  static const Color greyLight = Color(0xFFEEEEEE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
}

class AppStyles {
  static const TextStyle elevatedButtonTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const EdgeInsets xsmallPadding = EdgeInsets.all(4);
  static const EdgeInsets smallPadding = EdgeInsets.all(8);
  static const EdgeInsets mediumPadding = EdgeInsets.all(16);
  static const EdgeInsets largePadding = EdgeInsets.all(32);
  static const EdgeInsets xLargePadding = EdgeInsets.all(64);
  static const EdgeInsets xxLargePadding = EdgeInsets.all(128);

  static const double smallIconSize = 16;
  static const double mediumIconSize = 32;
  static const double largeIconSize = 64;
  static const double xlargeIconSize = 80;
  static const double x2largeIconSize = 160;

  // custom sizes
  static const double loadingIconSize = 220;
  static const double appBarSize = 60;

  static const double xsmallSize = 8;
  static const double smallSize = 16;
  static const double mediumSize = 32;
  static const double largeSize = 64;
  static const double xlargeSize = 80;
  static const double x2largeSize = 96;
  static const double x3largeSize = 160;

  static const double xlabelSmallSize = 4;
  static const double labelSmallSize = 8;
  static const double labelMediumSize = 16;
  static const double labelLargeSize = 24;

  static const TextStyle headlineLarge =
      TextStyle(fontSize: AppStyles.largeSize);

  static const TextStyle headlineMedium =
      TextStyle(fontSize: AppStyles.mediumSize);

  static const TextStyle labelLarge =
      TextStyle(fontSize: AppStyles.labelLargeSize);

  static const TextStyle labelMedium =
      TextStyle(fontSize: AppStyles.labelMediumSize);

  static const SizedBox xsmallVGap = SizedBox(height: 8);
  static const SizedBox xxsmallVGap = SizedBox(height: 16);
  static const SizedBox smallVGap = SizedBox(height: 24);
  static const SizedBox mediumVGap = SizedBox(height: 32);
  static const SizedBox largeVGap = SizedBox(height: 40);

  static const SizedBox xxsmallHGap = SizedBox(width: 8);
  static const SizedBox xsmallHGap = SizedBox(width: 16);
  static const SizedBox smallHGap = SizedBox(width: 24);
  static const SizedBox mediumHGap = SizedBox(width: 32);
  static const SizedBox largeHGap = SizedBox(width: 40);

  static const double xsmallRadius = 12;
  static const double smallRadius = 24;
  static const double mediumRadius = 40;
  static const double largeRadius = 64;
  static const double xlargeRadius = 80;
}
