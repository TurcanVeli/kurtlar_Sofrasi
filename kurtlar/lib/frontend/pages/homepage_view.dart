import 'package:flutter/material.dart';

void main() {
  runApp(
    BenimUyg(),
  );
}

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/images/bullet2.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  Container(
                    width: 300,
                    height: 100,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "KURTLAR SOFRASI",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Kurtlukta Düşeni Yemek Kanundur",
                      style: TextStyle(
                        color: Colors.white38, fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "YENİ OYUN",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "OYUNCU PROFİLİ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "NASIL OYNANIR?",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
