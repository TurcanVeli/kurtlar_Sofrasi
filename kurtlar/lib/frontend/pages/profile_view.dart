import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/register_view.dart';

// BU SINIF UZERINDE CIRCLE AVATAR UZERINE RESIM EKLEME OZELLIGI GETIRILECEK
// OYUNCU ISMI NASIL KAYDEDILIR O OGRENILECEK

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                });
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            backgroundColor: Colors.black,
            title: Text(translate(context).profile),
            centerTitle: true),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(50, 70, 50, 20),
            child: Column(children: [
              Text(
                translate(context).editprofile,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
                //Text
              ),
              SizedBox(height: 10),
              Text(
                translate(context).gamecode,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                '5X734A',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: translate(context).username,
                    hintStyle: TextStyle(color: Colors.blue),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black38, width: 2.0))),
              ),
              SizedBox(height: 15),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text(translate(context).save))
            ])));
  }
}
