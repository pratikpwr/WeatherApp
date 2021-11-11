import 'package:app/src/config/color_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  // TextStyles here

  static TextStyle titleTextStyle({
    bool isDark = false,
    FontWeight fontWeight = FontWeight.w500,
    double fontSize = 15,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      color: isDark ? ColorConstants.darkTextColor : ColorConstants.textColor,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle subTitleTextStyle({
    bool isDark = false,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 14,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      color: isDark
          ? ColorConstants.dartSubtextColor
          : ColorConstants.darkTextColor,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
