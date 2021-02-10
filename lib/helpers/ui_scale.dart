import 'package:flutter/material.dart';

class UIScale {
  static double deviceWidth;
  static double deviceHeight;

  static double width(double percentage) {
    return deviceWidth * (percentage / 100);
  }

  static double height(double percentage) {
    return deviceHeight * (percentage / 100);
  }

  static void init(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    deviceWidth = screenSize.width;
    deviceHeight = screenSize.height;
  }
}
