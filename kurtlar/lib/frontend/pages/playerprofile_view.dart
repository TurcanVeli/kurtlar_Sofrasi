import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/registerview.dart';

// BU SINIF UZERINDE CIRCLE AVATAR UZERINE RESIM EKLEME OZELLIGI GETIRILECEK
// OYUNCU ISMI NASIL KAYDEDILIR O OGRENILECEK

class profile extends StatefulWidget {
  const profile({super.key});

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
            title: Text('PLAYER PROFILE'),
            centerTitle: true),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(50, 70, 50, 20),
            child: Column(children: [
              Text(
                'Edit Profile',
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
                'Game Entry Code',
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
                    hintText: 'UserName',
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
                  child: Text('Save'))
            ])));
  }
}
