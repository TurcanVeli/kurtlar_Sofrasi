import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/pages/night_view.dart';
import '../../backend/lang/language_constant.dart';
import '../components/button.dart';
import '../models/users.dart';

//

class nightstartPage extends StatefulWidget {
  @override
  State<nightstartPage> createState() => _nightstartPageState();
}

class _nightstartPageState extends State<nightstartPage> {
  bool isGameOver = false;
  bool isMafiaWin = false;

  @override
  void initState() {
    int remainingMafia = 0;
    int remainingGov = 0;
    for (int i = 0; i < USERS.length; i++) {
      if (USERS[i].GetRole.GetTeam == "Mafya")
        remainingMafia++;
      else
        remainingGov++;
    }

    if (remainingMafia >= remainingGov) {
      isGameOver = true;
      isMafiaWin = true;
    } else if (remainingMafia == 0) isGameOver = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        // <-- STACK AS THE SCAFFOLD PARENT
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/night.jpg"), // <-- BACKGROUND IMAGE
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
              backgroundColor:
                  Colors.transparent, // <-- SCAFFOLD WITH TRANSPARENT BG
              body: !isGameOver
                  ? NightStartBody(context)
                  : isMafiaWin
                      ? Text("mafya kazandı")
                      : Text("Devlet kazandı"))
        ]);
  }

  SafeArea NightStartBody(BuildContext context) {
    return SafeArea(
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
    ));
  }
}
