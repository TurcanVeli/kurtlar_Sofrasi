import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/pages/register_view.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_view.dart';

// kurtlar register ve I am button //

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
    

  // Dogrulama ıcın olusturuldu.
  FirebaseAuth auth = FirebaseAuth.instance;

  var data;
  var mail = TextEditingController();
  var password = TextEditingController();
  @override
  void initState() {
    data = FirebaseFirestore.instance.collection('users');

    super.initState();
  }

  bool checkUserisValid(String mail, String password) {
    setState(() {
      for (int i = 0; i < data.docs.length; i++) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: StreamBuilder(
            stream: data.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return LoginPage(context);
            }));
  }

  Padding LoginPage(BuildContext context) {
    return Padding(
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
          controller: mail,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            hintText: "mail",
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

       
       // Elevated Button ıle degerı aldıgım zaman ıcındekı textı okumuyor
        /*
        ElevatedButton(
          onPressed: () async {
            try {
              final user = await auth.signInWithEmailAndPassword(
                  email: mail.text, password: password.text);
              if (user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }
            } catch (e) {
              print(e);
            }
          },
          child: const Text('Login'),
        ),

      */
        /*
        
        Button(
          buttonText: translate(context).login,
          where: Home(),
          Height: 40,
          Width: 375,
          fontSize: 25,
        ),
        */

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
    );
  }
}
