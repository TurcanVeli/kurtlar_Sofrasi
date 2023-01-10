import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';

import '../components/button.dart';
import '../components/gameoverComponent.dart';
import '../models/users.dart';
import 'daylight_view.dart';

//Oyunun BitmeKoşulu Burada Kontrol Edilecek.
//Oyun Bitmemişse Tartışma başladı yazacak ve devam butonu olacak.
//Oyun bitmiş ise kazananları ve herkesin rolünü gösterecek.

class DayStartPage extends StatefulWidget {
  @override
  State<DayStartPage> createState() => _DayStartPageState();
}

class _DayStartPageState extends State<DayStartPage> {
  bool isGameOver = false;
  bool isMafiaWin = false;

  /* Oyunun bitme şartı kontrol ediliyor */
  @override
  void initState() {
    int remainingMafia = 0;
    int remainingGov = 0;
    print(USERS.length);
    for (int i= 0; i < USERS.length; i++){
      if (USERS[i].GetRole.GetTeam == "Mafya") remainingMafia++;
      else remainingGov++;
    }

    if (remainingMafia >= remainingGov) {
        isGameOver = true; 
        isMafiaWin = true;

    }
    
    else if(remainingMafia == 0) isGameOver = true;

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
                  "assets/images/daylight.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor:
              Colors.transparent, // <-- SCAFFOLD WITH TRANSPARENT BG
          body: !isGameOver?  DiscussContainer(context)
                : gameOver(isMafiaWin),//Bu kısımda oyunu bitir çıkacak ve para dağıtılacak.
        ),
      ],
    );
  }

  Container DiscussContainer(BuildContext context) {
    return Container(
          color:Colors.transparent,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Text("GÜNEŞ DOĞDU", style: TextStyle(fontSize: 30,color: ColorConstant.instance.white,fontWeight: FontWeight.bold)),
                Text(
                 translate(context).discussstart,
                  style: TextStyle(fontSize: 30,color: ColorConstant.instance.white,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 500,
                ),
                BottomButtonContainerContiune(
                  context: context,
                    buttonText: translate(context).enddiscuss,
                    color: ColorConstant.instance.red,
                    ContainerColor: Colors.transparent,
                    where: DaylightPage(0)),
              ],
            ),
          ),
        );
  }
}
