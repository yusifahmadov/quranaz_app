import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* Theme (It can be changed in future) */

final TextTheme textTheme = TextTheme(
  /* Headline 1 Bold Text Theme */
  headline1: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 24),
  /* Text In The Button White Text Theme */
  subtitle1: GoogleFonts.nunito(fontWeight: FontWeight.w400, color: Colors.white),
  /* Default Main Text Theme */
  bodyText1: GoogleFonts.nunito(fontWeight: FontWeight.w400),
);
final ThemeData themeData = ThemeData(
    /* Main Color in App */
    primaryColor: const Color(0xff6BBD45),
    /* Button Color in App */
    splashColor: const Color(0xff6BBD45),
    /* Main Font Family in App */
    fontFamily: GoogleFonts.nunito().fontFamily,
    /* Text Field Main Color in App */
    cardColor: const Color(0xffF5F7F9));

class HeightSize {
  static double defaultFormHeight = 55;
  static double defaultButtonHeight = 40;
}

class AppFontSize {
  /* Main Font Size in App */
  static double mainFontSize = 26;
  /* Secondary Font Size in App */
  static double secondaryFontSize = 24;
}

class AppBorderRadiusSize {
  /* Main Border Radius Size in App */
  static var mainBorderRadiusSize = BorderRadius.circular(6);
} /* Theme END (It can be changed in future) */
