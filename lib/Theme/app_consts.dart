//? This File contains constans for the app layout

//? Padding

import 'package:flutter/cupertino.dart';

import '../utils/app_layout.dart';

class AppConsts {
  //? -------------------------------------------- APP: Genral  --------------------------------------------
  static const String appName = 'Geo Cam';
  static final double screenHeight = AppLayout.getScreenHeight();
  static final double screenWidth = AppLayout.getScreenWidth();
  static final double screenRatio = screenWidth / screenHeight;

  static const double menuPadH = 12;
  static const double menuPadV = 2;

  //? ----------------------------------------- Opiton Button Slim  -----------------------------------------
  // ignore: prefer_final_fields
  static double _opBtnSlimH = 38;
  static const double _opBtnSlimW = 85;

  static final double opBtnSlimPad = AppLayout.getHeight(4);
  static double opBtnSlimH = AppLayout.getHeight(_opBtnSlimH);
  static final double opBtnSlimW = AppLayout.getWidthPercent(_opBtnSlimW);
  static double opBtnSlimCapH = AppLayout.getHeight(_opBtnSlimH);
  static final double opBtnSlimCapW = AppLayout.getWidthPercent(_opBtnSlimW / 4);

  //? ----------------------------------------- Map Location Card  -----------------------------------------
  static final double locCardPad = AppLayout.getWidth(5);
  static final double locCardHeight = AppLayout.getWidth(110);
  static final double locCardWidth = screenWidth - locCardHeight - locCardPad * 3 - 1;
  static const double locCardBorderRoundVal = 10;
  static const Radius locCardBorderRound = Radius.circular(locCardBorderRoundVal);
}
