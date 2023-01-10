import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/service/auth.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/login_view.dart';
import 'package:kurtlar/main.dart';


/* This is the page to create your account for the game */
class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var username = TextEditingController();
  var password = TextEditingController();
  var mail = TextEditingController();
 
  /* Authentication service was initialized */
  AuthService _authService = AuthService();

/* This function generate a code for every user that entered the game. 
 * The person who creates the game  is going to use code in order to call the game */
  String generateCode() {
    var rng = new Random();
    var code = "";
    for (int i = 0; i < 5; i++) {
      if (i < 2) {
        // Generate a random letter
        code += new String.fromCharCode(rng.nextInt(26) + 65);
      } else {
        // Generate a random number
        code += rng.nextInt(10).toString();
      }
    }
    return code;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            });
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(translate(context).signup),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 20),
        child: Column(
          children: [
            TextField(
              controller: mail,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  hintText: 'Mail',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0))),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: username,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.accessibility_new,
                    color: Colors.black,
                  ),
                  hintText: translate(context).username,
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0))),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: password,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_person_outlined,
                    color: Colors.black,
                  ),
                  hintText: translate(context).password,
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0))),
            ),
            const SizedBox(height: 40),
           
           /* createPerson is the function of authService and authService was cretead in service folder */
            TextButton(
                onPressed: (() {
                  setState(() {
                    _authService
                        .createPerson(username.text, mail.text, password.text,
                            generateCode())
                        .then((value) {
                      return Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  });
                }),
                child: Text(translate(context).save))
          ],
        ),
      ),
    );
  }
}
