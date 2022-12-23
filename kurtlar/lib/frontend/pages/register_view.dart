import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/login_view.dart';
import 'package:kurtlar/main.dart';

class registerPage extends StatelessWidget {
  //const registerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('REGISTER'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 20),
        child: Column(
          children: [
            const TextField(
              style: TextStyle(color: Colors.red),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  hintText: 'E-mail',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0))),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: false,
              style: TextStyle(color: Colors.red),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_person_outlined,
                    color: Colors.black,
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0))),
            ),
            const SizedBox(height: 40),
            Button(
              buttonText: 'SIGN UP',
              where: LoginPage(),
              Height: 45,
              Width: 375,
            )
          ],
        ),
      ),
    );
  }
}
