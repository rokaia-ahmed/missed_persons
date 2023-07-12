import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle poppins = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  static TextStyle poppinsLight = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static TextStyle upload = GoogleFonts.lato(
    fontWeight: FontWeight.w600,
    fontSize: 23.0,
    color: Colors.white,
  );
}