//how to play
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppState(),
    );
  }
}

class MyAppState extends StatelessWidget {
  const MyAppState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Nasıl Oynanır?"),
      ),
      body: Center(
        child: TextButton(
          child: Text("NASIL OYNANIR"),
          onPressed: () {
            ShowAlertDialog(context);
          },
        ),
      ),
    );
  }

  void ShowAlertDialog(BuildContext context) {
    /*Widget okBtn = TextButton(
        onPressed: () {
          print("ok");
        },
        child: Text("OK"));*/
    Widget okBtn = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("TAMAM"));

    AlertDialog alert = AlertDialog(
      title: Text("Kurtlar Sofrası"),
      content: Text(
          "Kurtlar sofrası, 4 kişi ile 10 kişiye kadar oyuncular için bir oyundur. Her oyuncuya gizlice iki takımdan birine ait olan rol verilir:Derin Devlet ve Mafya"
              "Oyun 5 tura bölünmüştür. Her tur yeni bir lider oyuncuları bir göreve gitmeleri için seçeçektir. Göreve giden oyuncular görevin başarılı olup olmaması ilgili karar verir. Görevlerden 3’ü başarılı olursa Derin Devlet oyunu kazanır fakat görevlerden 3’ü başarısız olursa mafya kazanır. "
              "Derin devlete mensup oyuncular sadece başarılı oyu atabilir. Mafya mensupları ise dikkatleri kendilerine çekmemek için hem başarılı hem de başarısız oy atabilirler. "),
      actions: <Widget>[okBtn],
    );

    showDialog(
        context: context,
        builder: (BuildContext buildercontext) {
          return alert;
        });
  }
}
