import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/pages/night_view.dart';
import '../../backend/lang/language_constant.dart';
import '../components/button.dart';



class nightstartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 1000,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  "GECE BAŞLIYOR",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Text(
                    "Bütün oyuncular bir birine bakacak şekilde büyük bir çember halinde oturmalıdır. Cihaz oyuncular arasında paslanacak."
                    "Her oyuncu derin devlete veya mafyaya ait bir rol alacak. bu rolü kimseye söyleme."
                    "Her oyuncu rol aldıktan sonra ilk gece başlayacak.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Button(
                buttonText: translate(context).start,
                where: areUready(-1),
                Height: 40,
                Width: 375,
                fontSize: 25,
              ),
            ],
          ),
        )),
      )),
    );
  }
}
