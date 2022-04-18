import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.mPlusRounded1c(
      fontSize: 96.0,
      fontWeight: FontWeight.w300, // light
    ),
    headline2: GoogleFonts.mPlusRounded1c(
      fontSize: 60.0,
      fontWeight: FontWeight.w300, // light
    ),
    headline3: GoogleFonts.mPlusRounded1c(
      fontSize: 48.0,
      fontWeight: FontWeight.w400, // regular
    ),
    headline4: GoogleFonts.mPlusRounded1c(
      fontSize: 34.0,
      fontWeight: FontWeight.w400, // regular
    ),
    headline5: GoogleFonts.mPlusRounded1c(
      fontSize: 24.0,
      fontWeight: FontWeight.w400, // regular
    ),
    headline6: GoogleFonts.mPlusRounded1c(
      fontSize: 20.0,
      fontWeight: FontWeight.w500, // medium
    ),
    subtitle1: GoogleFonts.mPlusRounded1c(
      fontSize: 16.0,
      fontWeight: FontWeight.w400, // regular
    ),
    subtitle2: GoogleFonts.mPlusRounded1c(
      fontSize: 14.0,
      fontWeight: FontWeight.w500, // medium
    ),
    bodyText1: GoogleFonts.mPlusRounded1c(
      fontSize: 16.0,
      fontWeight: FontWeight.w400, // regular
    ),
    bodyText2: GoogleFonts.mPlusRounded1c(
      fontSize: 14.0,
      fontWeight: FontWeight.w400, // regular
    ),
    caption: GoogleFonts.mPlusRounded1c(
      fontSize: 12.0,
      fontWeight: FontWeight.w400, // regular
    ),
    button: GoogleFonts.mPlusRounded1c(
      fontSize: 14.0,
      fontWeight: FontWeight.w500, // medium
    ),
    overline: GoogleFonts.mPlusRounded1c(
      fontSize: 10.0,
      fontWeight: FontWeight.w400, // regular
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: textTheme,
      primarySwatch: Colors.deepOrange,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(100, 50)),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.orange,
      textTheme: textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            return Colors.orange;
          }),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white,),
          minimumSize: MaterialStateProperty.all(const Size(100, 50)),
        ),
      ),
    );
  }
}
