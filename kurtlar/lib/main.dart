import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/login_view.dart';
import 'package:kurtlar/frontend/pages/roles_view.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

//flutter run --no-sound-null-safety
class MyApp extends StatelessWidget {
  //MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kurtlar Sofrası',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
          primaryColor: Colors.indigo.shade900),
      home: Home(),
    );
  }
}
