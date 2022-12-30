import 'package:flutter/material.dart';

int theme_ = 2;

class AppColors {
  //? ------------------------- BG Color -------------------------
  static const Color _bgColor1 = Color(0xFF021827); // Dark Blue
  // Method
  // static Color bgColor() => _bgColor1;
  static Color bgColor() => Colors.white60;

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

  static final List<Color> _opSelected = [
    const Color(0xffd4a108),
    const Color(0xffe85a5a),
    const Color(0xff2196F3),
  ];
  // Method
  static Color opSelected() {
    return _opSelected[theme_];
  }

  //? -------------------- Not Selected Option BG Color --------------------
  static const Color _opNotSelected_1 = Color(0xff171717);
  // Method
  static Color opNotSelected() => _opNotSelected_1;

  //? -------------------- Text Color --------------------
  static const Color textColor1 = Colors.white;
  static const Color textColor0 = Colors.black;
}
