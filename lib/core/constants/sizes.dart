import 'package:flutter/cupertino.dart';

class Sizes {
  //margins
  static double get mainMargin => 10;

  static double get mediumMargin => 20;
  static double get largeMargin => 30;

  //heights
  static double get logoHeight => 40;

  static double get appbarHeight => 70;
  static double get iconSize => 15;

  //fonts
  static double get mainFont => 14;
  static double get largeFont => 16;

  static double get largeTitleFont => 25;
  static double get extraLargeTitleFont => 50;

  //btn
  static double get btnHeight => 45;

  static double get btnWidth => 330;

  static double get btnShadowHeight => 4;

  //border
  static double get btnBorderWidth => 2;

  //radius
  static double get primaryRadius => 10;
  static double get smallRadius => 3;

  static double get btnShadowRadius => 11;

  static BorderRadius get primaryBorder => BorderRadius.circular(Sizes.primaryRadius);
  static BorderRadius get smallBorder => BorderRadius.circular(Sizes.smallRadius);
}
