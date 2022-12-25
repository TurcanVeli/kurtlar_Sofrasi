import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/register_view.dart';

class Button extends StatefulWidget {
  String buttonText;
  Widget where;
  double Height;
  double Width;

  Button(
      {super.key,
      required this.buttonText,
      required this.where,
      required this.Height,
      required this.Width});

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
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          widget.buttonText,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
        )),
      ),
    );
  }
}

Container BottomButtonContainerContiune({required BuildContext context,required double height,required String buttonText,required Widget where}) {
  
  return Container(
    height: height,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: (() {
              Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => where));

          }),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(ColorConstant.instance.red),
          ),
          child: Text(buttonText)),
    ),
  );
}
