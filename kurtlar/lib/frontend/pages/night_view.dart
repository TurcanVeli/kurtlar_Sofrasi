import 'package:flutter/material.dart';

class nightPage extends StatefulWidget {
  

  @override
  State<nightPage> createState() => _nightPageState();
}

class _nightPageState extends State<nightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(child: Text("Gece Başladı",style: TextStyle(color: Colors.white),)),
    );
  }
}