import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontSourceSansProW800({required Color appcolor}) {
  return GoogleFonts.raleway(
    textStyle:
        TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: appcolor),
  );
}

TextStyle fontSourceSansPro700({required Color appcolor}) {
  return GoogleFonts.sourceSansPro(
    textStyle:
        TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: appcolor),
  );
}

TextStyle fontSourceSansProW600({required Color appcolor}) {
  return GoogleFonts.sourceSansPro(
    textStyle:
        TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: appcolor),
  );
}

TextStyle fontSourceSansProW400({required Color appcolor}) {
  return GoogleFonts.sourceSansPro(
    textStyle:
        TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: appcolor),
  );
}