import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  static Color get white => Colors.white;
  static Color get border => const Color(0xFFEFEFEF);
  static Color get text => const Color(0xFF202C43);
  static Color get grey => const Color(0xFF827D88);
  static Color get blue => const Color(0xFF61C3F2);

  final Color primary;

  AppColors({
    required this.primary,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
    );
  }
}
