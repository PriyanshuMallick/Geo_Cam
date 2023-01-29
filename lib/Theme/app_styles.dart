import 'package:flutter/material.dart';
import 'package:geo_cam/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextStyle menuText = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.textColor2,
    fontWeight: FontWeight.w900,
  );
  static final TextStyle mapCardText = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.mapCardTextColor,
    fontWeight: FontWeight.w900,
  );
  static TextStyle titleText = GoogleFonts.roboto(
    fontSize: 20,
    // color: AppColors.textColor1,
    fontWeight: FontWeight.w400,
  );
}
