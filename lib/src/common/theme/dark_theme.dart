import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  DarkTheme._();

  static const _primaryColor = Color(0xFF055AA3);
  static const _titleColor = Color(0xFFEDF4F8);
  static const _backgroundColor = Color(0xFF121517);
  static const _textColor = Color(0xFF51565A);
  static const _cardColor = Color(0xFF172026);
  static const _textButtonColor = Color(0xFFEDF4F8);
  static const _iconColor = Color(0xFFEDF4F8);

  static final schema = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: _primaryColor,
    backgroundColor: _backgroundColor,
    cardColor: _cardColor,
    textTheme: TextTheme(
      headline1: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: _titleColor,
      ),
      headline2: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: _titleColor,
      ),
      headline4: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: _titleColor,
      ),
      headline3: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: _titleColor,
      ),
      bodyText1: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: _textColor,
      ),
      caption: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: _textColor,
      ),
      overline: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: _titleColor,
      ),
      button: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: _textButtonColor,
      ),
    ),
    iconTheme: const IconThemeData(color: _iconColor),
  );
}
