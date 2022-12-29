import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  static getHeight(double pixels) {
    double sHeight = getScreenHeight();
    double x = sHeight / pixels;
    return sHeight / x;
  }

  static getWidth(double pixels) {
    double sWidth = getScreenWidth();
    double x = sWidth / pixels;
    return sWidth / x;
  }
}
