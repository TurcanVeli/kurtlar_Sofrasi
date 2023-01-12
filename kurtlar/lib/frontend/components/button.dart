import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/register_view.dart';


/* This button component will be used in different pages */
class Button extends StatefulWidget {
  String buttonText;
  VoidCallback kaydet;
  Widget where;
  double Height;
  double Width;
  double fontSize;

  Button(
      {this.buttonText,
      this.where,
      this.Height,
      this.Width,
      this.fontSize,
      this.kaydet});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget.where));
        });
      }),
      

      child: Container(
        height: widget.Height,
        width: widget.Width,
        decoration: BoxDecoration(
            color: ColorConstant.instance.Venetian_Red,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          widget.buttonText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorConstant.instance.white,
              fontSize: widget.fontSize),
        )),
      ),
    );
  }
}

Container BottomButtonContainerContiune(
    {BuildContext context,
    double height,
    String buttonText,
    Widget where,
    VoidCallback function,
    Color color,
    Color ContainerColor}) {
  if (color == null) {
    color = ColorConstant.instance.red;
  }
  if (ContainerColor == null) {
    ContainerColor = ColorConstant.instance.white;
  }
  return Container(
    height: height,
    color: ContainerColor,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: (() {
            if (where != null) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => where));
            } else {
              if (function != null) {
         
                function;
              } else {
                print("Debug");
              }
            }
          }),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
          ),
          child: Text(buttonText)),
    ),
  );
}
