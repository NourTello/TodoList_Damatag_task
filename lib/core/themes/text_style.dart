import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'light-colors.dart';


TextStyle appBartTextStyle({
  Color color = Colors.white,
  double fontSize = 25,
  var fontWeight = FontWeight.bold,
}) {
  return GoogleFonts.gowunBatang(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      );
}

//-------------------------------Head text---------------------------------------
TextStyle titleTextStyle(
    {Color color = primaryColor,
    double fontSize = 20,
    var fontWeight = FontWeight.w800}) {
  return GoogleFonts.gowunBatang(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight);
}


TextStyle buttonTextStyle({
  Color color = Colors.white,
  double fontSize = 20,
  var fontWeight = FontWeight.bold,
}) {
  return GoogleFonts.gowunBatang(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle normalTextStyle({
  Color color = Colors.black,
  double fontSize = 17,
  TextOverflow textOverFlow = TextOverflow.visible,
}) {
  return GoogleFonts.gowunBatang(
      color: color,
      fontSize: fontSize,
     );
}


