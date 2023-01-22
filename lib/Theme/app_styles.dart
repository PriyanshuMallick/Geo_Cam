import 'package:flutter/material.dart';
import 'package:geo_cam/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextStyle menuText = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.textColor1,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle timerText = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.mapCardTextColor(),
    fontWeight: FontWeight.w400,
  );

  static final TextStyle settingText2 = GoogleFonts.roboto(
    fontSize: 20,
    color: AppColors.mapCardTextColor(),
    fontWeight: FontWeight.w400,
  );

  static final TextStyle mapCardText2 = GoogleFonts.roboto(
    fontSize: 11,
    color: AppColors.mapCardTextColor(),
    fontWeight: FontWeight.w800,
  );

  static final TextStyle mapCardText1 = GoogleFonts.roboto(
    fontSize: 17,
    color: AppColors.mapCardTextColor(),
    fontWeight: FontWeight.w600,
  );
}
