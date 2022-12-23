import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/pages/register_view.dart';
import 'package:kurtlar/frontend/components/button.dart';

import 'home_view.dart';

// kurtlar register ve I am button //

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
        child: Column(children: [
          Image.asset(
            'assets/images/logo.png',
            height: 200,
            width: 200,
          ),
          SizedBox(height: 20),
          // ignore: prefer_const_constructors
          const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              hintText: 'Kullanıcı Adı',
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_person_outlined,
                  color: Colors.white,
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0))),
          ),
          const SizedBox(height: 25),
          Button(
            buttonText: 'LOG IN',
            where: registerPage(),
            Height: 40,
            Width: 375,
          ),
          const SizedBox(height: 15),
          const Text(
            '-------------- OR --------------',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 15),

          Button(
            buttonText: 'SIGN UP',
            where: Home(),
            Height: 40,
            Width: 375,
          )
        ]),
      ),
    );
  }
}
