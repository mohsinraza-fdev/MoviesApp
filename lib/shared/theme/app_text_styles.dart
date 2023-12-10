import 'package:flutter/material.dart';
import 'package:ten_twenty_test/shared/assets_gen/fonts.gen.dart';

typedef AppTextStyle = TextStyle Function(Color);

class AppTextStyles {
  static String get _primaryFontFamily => FontFamily.poppins;
  static String get _secondaryFontFamily => FontFamily.roboto;

  static TextStyle r12Poppins(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: color,
      );

  static TextStyle r14Poppins(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: color,
      );

  static TextStyle m12Poppins(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: color,
      );

  static TextStyle m14Poppins(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: color,
      );

  static TextStyle m16Poppins(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: color,
      );

  static TextStyle m18Poppins(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: color,
      );

  static TextStyle s12Poppins(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: color,
      );

  static TextStyle s14Poppins(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: color,
      );

  static TextStyle r10Roboto(Color color) => TextStyle(
        fontFamily: _secondaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: color,
      );

  static TextStyle b10Roboto(Color color) => TextStyle(
        fontFamily: _secondaryFontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 10,
        color: color,
      );
}
