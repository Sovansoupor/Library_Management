import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TColors {
  // Define primary, secondary, and other colors
  static const Color primary = Color(0xff78B3CE); // Green
  static const Color secondary = Color(0xffC9E6F0); // Blue
  static const Color background = Color(0xffFBF8EF); // Light grey
  static const Color accent = Color(0xffF96E2A); // Amber
   static const Color light = Color(0xffF5EDED);
  static const Color darkbg = Color(0xFF212121); // Dark grey
  static const Color grey = Color.fromARGB(255, 75, 75, 75); // Light grey

  // Define fonts using Google Fonts

  static final TextStyle greetingStyle = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: darkbg,
  );

  static final TextStyle greeting1 = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: darkbg,
  );


  static final TextStyle titleStyle = GoogleFonts.lexend(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: darkbg,
  );

  static final TextStyle bodyStyle = GoogleFonts.lexendDeca(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: grey,
  );

  static final TextStyle buttonStyle = GoogleFonts.lexendDeca(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: grey,
  );

  static final TextStyle captionStyle = GoogleFonts.lexend(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: darkbg,
  );
    static final TextStyle authorStyle = GoogleFonts.lexendDeca(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: grey,
  );

  static final TextStyle booktitle = GoogleFonts.lexend(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: darkbg,
  );
  static final TextStyle bookauthor = GoogleFonts.lexendDeca(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    color: grey,
  );


  // Create reusable theme data
  // static ThemeData get themeData {
  //   return ThemeData(
  //     primaryColor: primary,
  //     scaffoldBackgroundColor: background,
  //     textTheme: TextTheme(
  //       headline: titleStyle,
  //       bodyText: bodyStyle,
  //       button: buttonStyle,
  //       caption: captionStyle,
  //     ),
  //     appBarTheme: AppBarTheme(
  //       backgroundColor: primary,
  //       titleTextStyle: titleStyle.copyWith(color: Colors.white),
  //       iconTheme: const IconThemeData(color: Colors.white),
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: primary,
  //         textStyle: buttonStyle,
  //       ),
  //     ),
  //   );
  // }
}
