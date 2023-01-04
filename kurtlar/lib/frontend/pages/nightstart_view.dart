import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
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
              body:
                  !isGameOver ? NightStartBody(context) : gameOver(isMafiaWin))
        ]);
  }

  Column gameOver(bool isMafiaWin) {
    return Column(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        if (isMafiaWin)
          Expanded(
            flex: 10,
            child: Container(
                child: Center(
                    child: Text(
                        translate(context).mafiawin,
                        style: TextStyle(
                            color: ColorConstant.instance.white,
                            fontSize: 40)))),
          )
        else
          Expanded(
            flex: 10,
            child: Container(
                child: Center(
                    child: Text(
                        translate(context).govwin,
                        style: TextStyle(
                            color: ColorConstant.instance.white,
                            fontSize: 40)))),
          ),
        Expanded(flex: 1, child: SizedBox(height: 50)),
        Expanded(
            flex: 1,
            child: BottomButtonContainerContiune(
                where: Home(),
                ContainerColor: Colors.transparent,
                color: ColorConstant.instance.red,
                buttonText: translate(context).backhomepage))
      ],
    );
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
                translate(context).nightStart,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              buttonText: translate(context).start,
              where: Night(-1),
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
