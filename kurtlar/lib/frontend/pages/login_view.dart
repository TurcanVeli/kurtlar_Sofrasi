import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/pages/register_view.dart';
import 'package:kurtlar/frontend/components/button.dart';

import 'home_view.dart';

// kurtlar register ve I am button //

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
        // Gırıstekı Resım
        child: Column(children: [
          Image.asset(
            'assets/images/logo.png',
            height: 200,
            width: 200,
          ),
          SizedBox(height: 20),
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
          )
        ]),
      ),
    );
  }
}
