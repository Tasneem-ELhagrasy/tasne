import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.odorMeanChey(
        fontSize: 64,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: GoogleFonts.poppins(
          color: AppColors.black, fontSize: 24, fontWeight: FontWeight.w600),
      titleMedium: GoogleFonts.poppins(
          color: AppColors.grey, fontSize: 17, fontWeight: FontWeight.w400),
    ),
  );
}
