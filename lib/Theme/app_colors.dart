import 'package:flutter/material.dart';

Map<String, int> theme = {
  'buttons': 2,
  'mapCardBG': 1,
};

class AppColors {
  //? ------------------------- BG Color -------------------------
  // static const Color _bgColor1 = Color(0xFF021827); // Dark Blue
  // Method
  // static Color bgColor() => _bgColor1;
  static Color bgColor() => Colors.black;
  // static Color bgColor() => Colors.white60;

  //? -------------------- Main Menu BG Color --------------------
  static const Color _mainMenuBG_1 = Color(0x4d000000);
  // Method
  static Color mainMenuBG() => _mainMenuBG_1;

  //? -------------------- Menu Icon Color --------------------
  static const Color _menuIcon_1 = Colors.white;
  // Method
  static Color menuIcon() => _menuIcon_1;

  //? -------------------- Map Card BG Color --------------------
  static const List<Color> _mapCardBG = [
    Color(0xcfffffff),
    Color(0xcf232323),
  ];
  // Method
  static Color mapCardBG() {
    int index = theme['mapCardBG'] ?? 0;
    return _mapCardBG[index];
  }

  //? -------------------- Timer Option Active Color --------------------
  static const Color _oPTimer_1 = Color(0xff2b2b2b);
  // Method
  static Color oPTimer() => _oPTimer_1;

  //? -------------------- Selected Option BG Color --------------------

  static const List<Color> _buttonColors = [
    Color(0xffd4a108),
    Color(0xffe85a5a),
    Color(0xff2196F3),
  ];
  // Method
  static Color opSelected() {
    int index = theme['buttons'] ?? 0;
    return _buttonColors[index];
  }

  //? -------------------- Not Selected Option BG Color --------------------
  static const Color _opNotSelected_1 = Color(0xff171717);
  // Method
  static Color opNotSelected() => _opNotSelected_1;

  //? ----------------------------- Text Color -----------------------------
  static const Color textColor1 = Colors.white;
  static const Color textColor0 = Colors.black;
  static const List<Color> textColors = [
    Colors.black,
    Colors.white,
  ];
  // Method
  static Color mapCardTextColor() {
    int index = theme['mapCardBG'] ?? 0;
    return textColors[index];
  }
}
