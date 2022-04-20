import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.dart';

class ThemeConfig {
  static ThemeData simpleTheme(ColorScheme colorScheme) {
    return ThemeData(
        colorScheme: colorScheme,
        textTheme: TextTheme(
          headline1: GoogleFonts.montserrat(
            fontSize: 98,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
          ),
          headline2: GoogleFonts.montserrat(
            fontSize: 61,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
          headline3: GoogleFonts.montserrat(
            fontSize: 49,
            fontWeight: FontWeight.w400,
          ),
          headline4: GoogleFonts.montserrat(
            fontSize: 35,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          headline5: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          headline6: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          subtitle1: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          subtitle2: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyText1: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyText2: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          button: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          caption: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          overline: GoogleFonts.openSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ));
  }

  static ThemeData get darkTheme => simpleTheme(darkColorScheme);

  static ThemeData get lightTheme => simpleTheme(lightColorScheme);

  // convert color scheme to theme data

  static ThemeData customTheme(ColorScheme colorScheme) {
    return ThemeData(
        primaryColor: colorScheme.primary,
        backgroundColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        errorColor: colorScheme.error,
        buttonTheme: ButtonThemeData(
          buttonColor: colorScheme.primary,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: colorScheme.background,
          elevation: 0,
          iconTheme: IconThemeData(
            color: colorScheme.primary,
          ),
          toolbarTextStyle: TextTheme(
            headline6: TextStyle(
              color: colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ).bodyText2,
          titleTextStyle: TextTheme(
            headline6: TextStyle(
              color: colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ).headline6,
        ),
        iconTheme: IconThemeData(
          color: colorScheme.primary,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: colorScheme.primary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          bodyText1: TextStyle(
            color: colorScheme.primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodyText2: TextStyle(
            color: colorScheme.primary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          caption: TextStyle(
            color: colorScheme.primary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          headline1: TextStyle(
            color: colorScheme.primary,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
