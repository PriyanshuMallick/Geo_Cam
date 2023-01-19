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
  static final double opitonBtnSlimHL = AppLayout.getHeightPercent(7);
  static final double opitonBtnSlimWL = AppLayout.getWidthPercent(85);
  static final double opitonBtnSlimHS = AppLayout.getHeightPercent(4.5);
  static final double opitonBtnSlimWS = AppLayout.getWidthPercent(85 / 4);

  //? ----------------------------------------- Map Location Card  -----------------------------------------
  static final double locCardPad = AppLayout.getWidth(5);
  static final double locCardHeight = AppLayout.getWidth(110);
  static final double locCardWidth = screenWidth - locCardHeight - locCardPad * 3 - 1;
  static const double locCardBorderRoundVal = 10;
  static const Radius locCardBorderRound = Radius.circular(locCardBorderRoundVal);
}
