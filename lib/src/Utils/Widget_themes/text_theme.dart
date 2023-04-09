import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constants/Color.dart';



class TTextTheme{
  static  TextTheme lightTextTheme = TextTheme(
      headline4:GoogleFonts.poppins(
          color: TBlack,
          fontWeight: FontWeight.normal,
          fontSize: 15.0
      ),headline3:GoogleFonts.poppins(
      color: TBlack,
      fontWeight: FontWeight.w600,
      fontSize: 17.0
  ),
      headline2:GoogleFonts.poppins(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          height: 1.1
      ),
      headline1:GoogleFonts.poppins(
          color: Colors.black87,
          fontWeight: FontWeight.normal,
          fontSize: 55.0,
          height: 1.5
      )
  );
  static  TextTheme darkTextTheme = TextTheme(
      headline4:GoogleFonts.poppins(
          color: TWhite,
          fontWeight: FontWeight.normal,
          fontSize: 15.0
      ),headline3:GoogleFonts.poppins(
      color: TWhite,
      fontWeight: FontWeight.w600,
      fontSize: 17.0
  ),
      headline2:GoogleFonts.poppins(
          color: TWhite,
          fontWeight: FontWeight.w600,
          fontSize: 24.0
      ),
      headline1:GoogleFonts.poppins(
          color: TWhite,
          fontWeight: FontWeight.normal,
          fontSize: 55.0
      )
  );
}