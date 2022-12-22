import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/login_view.dart';
import 'package:kurtlar/frontend/pages/roles_view.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//TODO Dil değiştirme yarım kaldı
void main() {
  runApp(MyApp());
}

//flutter run --no-sound-null-safety
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  //MyApp({super.key});
  late Locale _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/lang/'];

    return MaterialApp(
      locale: _locale,
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
