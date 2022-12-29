import 'package:flutter/material.dart';

int theme_ = 0;

class MyColors {
  //? -------------------- Main Menu BG Color --------------------
  static const Color _mainMenuBG_1 = Color(0x4d000000);
  // Method
  static Color mainMenuBG() => _mainMenuBG_1;

  //? -------------------- Menu Icon Color --------------------
  static const Color _menuIcon_1 = Colors.white;
  // Method
  static Color menuIcon() => _menuIcon_1;

  //? -------------------- Map Data BG Color --------------------
  static const Color _mapDataBG_1 = Color(0xcf232323);
  // Method
  static Color mapDataBG() => _mapDataBG_1;

  //? -------------------- Timer Option Active Color --------------------
  static const Color _oPTimer_1 = Color(0xff2b2b2b);
  // Method
  static Color oPTimer() => _oPTimer_1;

  //? -------------------- Selected Option BG Color --------------------
  static const Color _oPSelected_1 = Color(0xffd4a108);
  static const Color _oPSelected_2 = Color(0xffe85a5a);
  // Method
  static Color oPSelected() {
    if (theme_ == 1) return _oPSelected_2;
    return _oPSelected_1;
  }

  //? -------------------- Not Selected Option BG Color --------------------
  static const Color _oPNotSelected_1 = Color(0xff171717);
  // Method
  static Color oPNotSelected() => _oPNotSelected_1;

  //? -------------------- Text Color --------------------
  static const Color textColor1 = Colors.white;
  static const Color textColor0 = Colors.black;
}
