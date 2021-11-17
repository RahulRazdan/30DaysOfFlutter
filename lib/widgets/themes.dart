import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
      primarySwatch: Colors.amber,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.amberAccent,
      ));

  static ThemeData get darkTheme => ThemeData(brightness: Brightness.dark);
}
