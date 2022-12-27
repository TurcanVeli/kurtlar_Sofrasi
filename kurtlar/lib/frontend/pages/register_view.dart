import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/login_view.dart';
import 'package:kurtlar/main.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        /* Logın sayfasına donmek ıcın ıcon koyuldu */
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
    
    /* Sayfa govdesınde 2 adet textFıeld 1 adet button var */
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 20),
        child: Column(
          children: [
            
            /* Nıckname'ı alan textFıeld */
            TextField(
              style: TextStyle(color: Colors.red),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  hintText: translate(context).username,
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0))),
            ),
            const SizedBox(height: 10),
           
           /* Sıfreyı alan textFıeld */
            TextField(
              obscureText: false,
              style: TextStyle(color: Colors.red),
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
            
            /* Uyelık olusturulduktan sonra Logın sayfasına gerı donulecek */
            Button(
              buttonText: translate(context).signup,
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
