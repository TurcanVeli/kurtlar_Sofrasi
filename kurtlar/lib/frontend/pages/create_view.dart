// create sayfasi
import 'package:flutter/material.dart';

class starting extends StatelessWidget {
  const starting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(70),
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'images/wolf_logo.png',
                  )),
              Container(
                width: 1000,
                height: 40,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kur",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Text("       "
                      "Bütün oyuncular bir birine bakacak şekilde büyük bir çember halinde oturmalıdır. Cihaz oyuncular arasında paslanacak."
                      "Her oyuncu derin devlete veya mafyaya ait bir rol alacak. bu rolü kimseye söyleme."
                      "Her oyuncu rol aldıktan sonra ilk gece başlayacak."),
                ),
              ),
              Container(
                width: 100,
                height: 40,
                child: TextButton(
                  onPressed: () {},
                  child: Text("HAZIR"),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    primary: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
