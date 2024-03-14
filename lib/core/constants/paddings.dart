import 'package:flutter/cupertino.dart';

class Paddings {
  static const medium = 16.0;
  static const big = 32.0;
  static const mediumAll = EdgeInsets.all(medium);
  static const mediumBottom = EdgeInsets.only(bottom: medium);
  static const mediumRight = EdgeInsets.only(right: medium);
  static const mediumHorizontal = EdgeInsets.symmetric(horizontal: medium);
  static const mediumAllBottomBig = EdgeInsets.fromLTRB(medium, medium, medium, big);
}
