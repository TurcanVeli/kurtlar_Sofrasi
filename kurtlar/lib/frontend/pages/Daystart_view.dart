import 'package:flutter/material.dart';

//Oyunun BitmeKoşulu Burada Kontrol Edilecek.
//Oyun Bitmemişse Tartışma başladı yazacak ve devam butonu olacak.
//Oyun bitmiş ise kazananları ve herkesin rolünü gösterecek.


class DayStartPage extends StatefulWidget {


  @override
  State<DayStartPage> createState() => _DayStartPageState();
}

class _DayStartPageState extends State<DayStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Sabah oldu")),
    );
  }
}