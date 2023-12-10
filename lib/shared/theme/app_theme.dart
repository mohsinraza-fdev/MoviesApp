import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';

class AppTheme {
  static AppColors colors(BuildContext context) =>
      Theme.of(context).extension<AppColors>() ?? lightThemeColors;

  static AppColors get lightThemeColors => AppColors(
        primary: const Color(0xFF2E2739),
      );

  static ThemeData get light => ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          lightThemeColors,
        ],
        scaffoldBackgroundColor: const Color(0xFFF6F6FA),
      );

  static Color? statusBarColor;

  static void brightenStatusBar() => SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          statusBarColor: statusBarColor,
        ),
      );
  static void darkenStatusBar() => SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: statusBarColor,
        ),
      );
  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
      ),
    );
    statusBarColor = color;
  }
}
