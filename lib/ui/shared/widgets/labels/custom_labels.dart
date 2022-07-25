import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/custom_colors.dart';

class CustomLabels {
  static TextStyle logoText = GoogleFonts.montserratAlternates(
      fontSize: 26, fontWeight: FontWeight.bold, color: CustomColors.mainColor);

  static TextStyle h1 = GoogleFonts.montserratAlternates(
      fontSize: 36, fontWeight: FontWeight.w400);
  static TextStyle h2 = GoogleFonts.montserratAlternates(
      fontSize: 30, fontWeight: FontWeight.w400);
  static TextStyle h3 = GoogleFonts.montserratAlternates(
      fontSize: 24, fontWeight: FontWeight.w400);
  static TextStyle h4 =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400);
}
