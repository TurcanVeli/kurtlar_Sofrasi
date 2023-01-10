import 'package:flutter/material.dart';

/* This class arranges the height and width the image,text or container according to height,width of different phone*/
/* Methods of this class can be called if you write a base in front of the class */
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
}
