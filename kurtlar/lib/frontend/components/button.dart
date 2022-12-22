import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/pages/registerview.dart';

class Button extends StatefulWidget {
  String buttonText;
  Widget where;

  Button({super.key, required this.buttonText, required this.where});

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
        height: 40,
        width: 375,
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
