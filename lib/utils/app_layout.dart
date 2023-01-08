import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenHeight() {
    return Get.height;
  }

  static double getScreenWidth() {
    return Get.width;
  }

  static double getHeight(double pixels) {
    double sHeight = getScreenHeight();
    double x = sHeight / pixels;
    return sHeight / x;
  }

  static double getWidth(double pixels) {
    double sWidth = getScreenWidth();
    double x = sWidth / pixels;
    return sWidth / x;
  }

  static double getHeightPercent(double percent) {
    return (percent * getScreenHeight()) / 100;
  }

  static double getWidthPercent(double percent) {
    return (percent * getScreenWidth()) / 100;
  }
}
