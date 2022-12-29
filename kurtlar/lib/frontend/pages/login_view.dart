import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/base/mediaQuery.dart';
import 'package:kurtlar/frontend/pages/register_view.dart';
import 'package:kurtlar/frontend/components/button.dart';

import 'home_view.dart';

// kurtlar register ve I am button //

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var data = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 90, 40, 20),
        // Gırıstekı Resım
        child: Column(children: [
          Image.asset(
            'assets/images/logo.png',
            height: 250,
            width: 250,
          ),
          SizedBox(height: 5),
          // Nıckname alan yer
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              hintText: translate(context).username,
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Sıfre Alan Yer
          TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_person_outlined,
                  color: Colors.white,
                ),
                hintText: translate(context).password,
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0))),
          ),
          const SizedBox(height: 25),
          // LOGIN BUTTONU HOME SAYFASINA GIDECEK
          Button(
            buttonText: translate(context).login,
            where: Home(),
            Height: 40,
            Width: 375,
            fontSize: 25,
          ),
          const SizedBox(height: 15),
          Text(
            '-------------- ${translate(context).or} --------------',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 15),
          // SIGN UP BUTTONU REGISTER SAYFASINA GIDECEK
          Button(
            buttonText: translate(context).signup,
            where: Register(),
            Height: 40,
            Width: 375,
            fontSize: 25,
          )
        ]),
      ),
    );
  }
}
