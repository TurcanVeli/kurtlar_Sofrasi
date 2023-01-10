import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/service/auth.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/pages/profile_view.dart';
import 'package:kurtlar/frontend/pages/register_view.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_view.dart';

/* This is the first page of our application */

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> with CacheID {
  
  var mail = TextEditingController();
  var password = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  /* Authentication service is going to used in this page*/
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: LoginPage(context));
  }

  Padding LoginPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 90, 40, 20),
      child: Column(children: [
        Image.asset(
          'assets/images/logo.png',
          height: 250,
          width: 250,
        ),
        SizedBox(height: 5),

        TextField(
          controller: mail,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            hintText: "Mail",
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Sıfre Alan Yer
        TextField(
          controller: password,
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

        /* This button is going to check if our information is in database */
        /* If it is, home page will be displayed */
        GestureDetector(
          onTap: (() async {
            _authService.signIn(mail.text, password.text).then((value) {
              if (value != null) {
                print(value.uid);
                SetID(value.uid ?? '');
              }
              return Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            });
          }),
          child: Container(
            height: 40,
            width: 375,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 189, 13, 42),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              'LOGIN',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25),
            )),
          ),
        ),

        const SizedBox(height: 15),

        Text(
          '-------------- ${translate(context).or} --------------',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 15),
        
        /* This is the button send you to register page */
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
