import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:kurtlar/frontend/pages/registerview.dart';
import 'package:kurtlar/frontend/components/button.dart';

// kurtlar register ve I am button //
=======
import '../pages/resgister_view.dart';
import '../components/button.dart';
>>>>>>> 8115496a0a7a63e4c4412cbdd6907d4f23f92d8e

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
            'images/logo2.png',
            height: 200,
            width: 200,
          ),
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
<<<<<<< HEAD
          Button(buttonText: 'LOG IN', where: registerPage()),
=======
          Button(
              buttonText: 'LOG IN',
              where: registerPage()), //where kalakcak buradan

>>>>>>> 8115496a0a7a63e4c4412cbdd6907d4f23f92d8e
          const SizedBox(height: 15),
          const Text(
            '-------------- OR --------------',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 15),

<<<<<<< HEAD
          Button(buttonText: 'SIGN UP', where: registerPage())
=======
          Button(
            buttonText: 'SIGN UP',
            where: registerPage(),
          )
>>>>>>> 8115496a0a7a63e4c4412cbdd6907d4f23f92d8e
        ]),
      ),
    );
  }
}
