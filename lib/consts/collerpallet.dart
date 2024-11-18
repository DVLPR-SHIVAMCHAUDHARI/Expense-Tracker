import 'package:flutter/material.dart';

class Appcolor {
  static Color greyTextColor = Color(0xffAEAEB2);
  static Color blueColor = Color(0xff007AFF);
  static Gradient bluegradient = const LinearGradient(
      colors: [Color(0xff192CDB), Color(0xff0E76E9)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static Gradient floatingButtonGradient = RadialGradient(
    colors: [Color(0xff7DD4FB), Color(0xff007AFF)],
    radius: BorderSide.strokeAlignCenter,
  );
}
