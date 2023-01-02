import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/pages/nightstart_view.dart';

import '../base/color_constants.dart';
import '../components/button.dart';
import '../models/users.dart';

//Gündüz oylamaları silinecek. Mafyanın görevleri işleyecek. Özellikle nizamettin
class DayLightreport extends StatefulWidget {
  @override
  State<DayLightreport> createState() => _DayLightreportState();
}

class _DayLightreportState extends State<DayLightreport> {
  bool iJail = false;
  int deadindex = -1;
  //berabere oy durumununda kimse hapise girmeyecek.Sonra yazılacak bu durum
  @override
  void initState() {
    int index = 0;
    int max = USERS[index].GetVote;
    for (int i = 0; i < USERS.length; i++) {
      if (CloningUser[i].GetVote >= max) {
        max = CloningUser[i].GetVote;
        index = i;
      }
      CloningUser[i].SetVote(0);
    }
    if (max != 0) {
      CloningUser[index].setJail();
      USERS.removeAt(index);
      iJail = true;
      deadindex = index;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return iJail
        ? Stack(
            // <-- STACK AS THE SCAFFOLD PARENT
            children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/Jail.png"), // <-- BACKGROUND IMAGE
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Scaffold(
                  backgroundColor:
                      Colors.transparent, // <-- SCAFFOLD WITH TRANSPARENT BG
                  body: Container(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          Text(CloningUser[deadindex].GetName,
                              style: TextStyle(
                                  color: ColorConstant.instance.white,
                                  fontSize: 15)),
                          CircleAvatar(
                            radius: 40,
                            child: Image.asset("assets/images/deafultAvatar.png"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          BottomButtonContainerContiune(
                              context: context,
                              buttonText: "DEVAM",
                              color: ColorConstant.instance.red,
                              ContainerColor: Colors.transparent,
                              where: nightstartPage()),
                        ],
                      ),
                    ),
                  ),
                )
              ])
        : Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Kimse Hapise girmedi",
                  style: TextStyle(
                      fontSize: 30, color: ColorConstant.instance.black),
                ),
              ],
            ),
          );
  }
}
