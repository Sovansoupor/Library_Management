import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TColors {
  // Define primary, secondary, and other colors
  static const Color primary = Color(0xff355F2E); // Green
  static const Color secondary = Color(0xffFFE3E3); // Blue
  static const Color background = Color(0xffFEF9F2); // Light grey
  static const Color accent = Color(0xffC9E9D2); // Amber
  static const Color darkbg = Color(0xFF212121); // Dark grey
  static const Color textSecondary = Color(0xff000B58); // Light grey

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


  static final TextStyle titleStyle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: darkbg,
  );

  static final TextStyle bodyStyle = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textSecondary,
  );

  static final TextStyle buttonStyle = GoogleFonts.lato(
    fontWeight: FontWeight.w800,
    color: darkbg,
  );

  static final TextStyle captionStyle = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: darkbg,
  );
  static final TextStyle authorStyle = GoogleFonts.lato(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
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
