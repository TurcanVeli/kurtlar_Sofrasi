import 'package:flutter/cupertino.dart';


// It will be complated later. 
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  static double changeTheHeight(double dimension) {
    return screenHeight * dimension;
  }

  static double changeTheWidth(double dimension2) {
    return screenWidth * dimension2;
  }
}
