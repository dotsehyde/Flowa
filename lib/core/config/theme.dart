import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Color(0xFFFB847C),
    primaryColorLight: Color(0xFFFB847C),
    primaryColorDark: Color(0xFF011A51),
    colorScheme: ColorScheme.light(
      primary: Color(0xFFFB847C),
      error: Colors.red.shade400,
      brightness: Brightness.light,
      secondary: Color(0xFF011A51),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Color(0xFFFB847C))),
    scaffoldBackgroundColor: Color(0xFFF3F3F3),
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFB847C)),
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
    primaryColor: Color(0xFFFB847C),
    primaryColorLight: Color(0xFFFB847C),
    primaryColorDark: Color(0xFF011A51),
    scaffoldBackgroundColor: Color(0xFF010117),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFFFB847C),
      error: Colors.red.shade400,
      brightness: Brightness.dark,
      secondary: Color(0xFF011A51),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFB847C)),
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
