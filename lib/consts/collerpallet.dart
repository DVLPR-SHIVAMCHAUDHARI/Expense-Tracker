import 'package:flutter/material.dart';

class Appcolor {
  static Color greyTextColor = const Color(0xffAEAEB2);
  static Color blueColor = const Color(0xff007AFF);
  static Gradient bluegradient = const LinearGradient(
      colors: [Color(0xff192CDB), Color(0xff0E76E9)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static Gradient floatingButtonGradient = const LinearGradient(
      colors: [Color(0xff7DD4F0), Color(0xff007AFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
}
