
import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/register_view.dart';

class Button extends StatefulWidget {
  String buttonText;
  VoidCallback kaydet;
  Widget where;
  double Height;
  double Width;
  double fontSize;

  Button({this.buttonText, this.where, this.Height, this.Width, this.fontSize,this.kaydet});

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
      // GIRIS SAYFASI OLCUTLERI HEIGHT :40 , WIDTH : 375

      child: Container(
        height: widget.Height,
        width: widget.Width,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 189, 13, 42),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          widget.buttonText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
    Color color,}) {
  if (color == null) {
    color = ColorConstant.instance.red;
  }
  return Container(
    height: height,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: (() {
            if (where != null) {
              
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => where));
            } else {
              if (function != null) {
                print("object");
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
