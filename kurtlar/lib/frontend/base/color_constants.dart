import 'dart:ui';

/* This class is going to specify which theme is going to use in pages */

class ColorConstant {
  static ColorConstant instance = ColorConstant._init();
  ColorConstant._init();

  final black = Color.fromARGB(255, 0, 0, 0);
  final red = Color.fromARGB(255, 255, 2, 2);
  final white = Color.fromARGB(255, 255, 255, 255);
  final Catskill_White = Color.fromARGB(255, 230, 229, 229);
  final Venetian_Red = Color.fromARGB(255, 189, 13, 42);
}
