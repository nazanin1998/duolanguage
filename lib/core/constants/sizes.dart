import 'package:flutter/cupertino.dart';

class Sizes {
  //margins
  static double get mainMargin => 13;

  static double get largeMargin => 30;

  //heights
  static double get logoHeight => 40;

  static double get appbarHeight => 70;

  //fonts
  static double get mainFont => 14;

  static double get largeTitleFont => 25;

  //btn
  static double get btnHeight => 45;

  static double get btnWidth => 330;

  static double get btnShadowHeight => 4;

  //border
  static double get btnBorderWidth => 2;

  //radius
  static double get btnRadius => 10;

  static double get btnShadowRadius => 11;

  static BorderRadius get primaryBorder => BorderRadius.circular(Sizes.btnRadius);
}
