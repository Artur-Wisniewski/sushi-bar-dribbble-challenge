import 'package:flutter/cupertino.dart';

class Paddings {
  static const tiny = 4.0;
  static const small = 8.0;
  static const medium = 16.0;
  static const big = 32.0;
  static const large = 128.0;

  static const tinyAll = EdgeInsets.all(tiny);
  static const smallRight = EdgeInsets.only(right: small);
  static const mediumAll = EdgeInsets.all(medium);
  static const mediumBottom = EdgeInsets.only(bottom: medium);
  static const mediumRight = EdgeInsets.only(right: medium);
  static const mediumHorizontal = EdgeInsets.symmetric(horizontal: medium);
  static const mediumAllBottomBig = EdgeInsets.fromLTRB(medium, medium, medium, big);
  static const mediumAllBottomNone = EdgeInsets.fromLTRB(medium, medium, medium, 0);
  static const listPadding = EdgeInsets.fromLTRB(medium, 0, medium, large);

}
