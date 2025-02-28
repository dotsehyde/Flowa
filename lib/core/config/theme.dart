import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryColor = Color(0xFFFB847C);
ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryColor,
    primaryColorDark: Color(0xFF011A51),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      error: Colors.red.shade400,
      brightness: Brightness.light,
      secondary: Color(0xFF011A51),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.grey,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: kPrimaryColor,
      primaryContrastingColor: Color(0xFF011A51),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: kPrimaryColor)),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade600),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.titilliumWeb(color: Colors.black),
      headlineMedium: GoogleFonts.titilliumWeb(color: Colors.black),
      headlineSmall: GoogleFonts.titilliumWeb(color: Colors.black),
      bodyLarge: GoogleFonts.poppins(color: Colors.black),
      bodyMedium: GoogleFonts.poppins(color: Colors.black),
      bodySmall: GoogleFonts.poppins(color: Colors.black),
    ));

ThemeData darkTheme = ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryColor,
    primaryColorDark: Color(0xFF011A51),
    scaffoldBackgroundColor: Color(0xFF010117),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: kPrimaryColor,
      error: Colors.red.shade400,
      brightness: Brightness.dark,
      secondary: Color(0xFF011A51),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF010117),
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade600),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.titilliumWeb(color: Colors.white),
      headlineMedium: GoogleFonts.titilliumWeb(color: Colors.white),
      headlineSmall: GoogleFonts.titilliumWeb(color: Colors.white),
      bodyLarge: GoogleFonts.poppins(color: Colors.white),
      bodyMedium: GoogleFonts.poppins(color: Colors.white),
      bodySmall: GoogleFonts.poppins(color: Colors.white),
    ));
