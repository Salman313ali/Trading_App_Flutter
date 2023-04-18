import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constants/Color.dart';



class TTextTheme{
  static  TextTheme lightTextTheme = TextTheme(
      headline4:GoogleFonts.montserrat(
          color: TBlack,
          fontWeight: FontWeight.normal,
          fontSize: 15.0
      ),headline3:GoogleFonts.montserrat(
    letterSpacing: 1,
      color: TBlack,
      fontWeight: FontWeight.w600,
      fontSize: 25.0
  ),
      headline2:GoogleFonts.montserrat(
          color: Colors.black54,
          fontWeight: FontWeight.w500,

          fontSize: 28.0,
          height: 1.1
      ),
      headline1:GoogleFonts.montserrat(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 37.0,
          height: 1.5
      )
  );
  static  TextTheme darkTextTheme = TextTheme(
      headline4:GoogleFonts.montserrat(
          color: TWhite,
          fontWeight: FontWeight.normal,
          fontSize: 15.0
      ),headline3:GoogleFonts.montserrat(
      color: TWhite,
      fontWeight: FontWeight.w600,
      fontSize: 17.0
  ),
      headline2:GoogleFonts.montserrat(
          color: TWhite,
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          height: 1.1
      ),
      headline1:GoogleFonts.montserrat(
          color: TWhite,
          fontWeight: FontWeight.normal,
          fontSize: 55.0
      )
  );
}