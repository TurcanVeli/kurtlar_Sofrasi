import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/models/players.dart';
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
  Players jailed = null;
  //berabere oy durumununda kimse hapise girmeyecek.Sonra yazılacak bu durum
  @override
  void initState () {
    int index = 0;
    int max = USERS[index].GetVote;
    for (int i = 0; i < USERS.length; i++) {
      if (USERS[i].GetVote >= max) {
        max = USERS[i].GetVote;
        if (max != 0){
        jailed  = USERS[i];
        }
      }
      USERS[i].SetVote(0);
    }
    if (jailed != null){
      jailed.setDead();
      USERS.remove(jailed);
      //Burada ve nightreportta ölenin hangi takımda oluğ olmadığı kontrol edilmeli ve ona göre listelerden çıkartılmalı
      GovermentUsers.remove(jailed);
      MafiasUsers.remove(jailed);
      iJail = true;
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
                    color: Colors.transparent,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          Text(translate(context).judge_1,
                              style: TextStyle(
                                  color: ColorConstant.instance.white,
                                  fontSize: 15)),
                          SizedBox(
                            height: 150,
                          ),
                          Text(jailed.GetName,
                              style: TextStyle(
                                  color: ColorConstant.instance.white,
                                  fontSize: 15)),
                          CircleAvatar(
                            radius: 40,
                            child:
                                Image.asset("assets/images/deafultAvatar.png"),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          BottomButtonContainerContiune(
                              context: context,
                              buttonText: translate(context).contiune,
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
                 " ${translate(context).votes} ve ${translate(context).nojail} ",
                  style: TextStyle(
                      fontSize: 30, color: ColorConstant.instance.black),
                ),
                 SizedBox(
                  height: 100,
                ),
                BottomButtonContainerContiune(
                              context: context,
                              buttonText: translate(context).contiune,
                              color: ColorConstant.instance.red,
                              ContainerColor: Colors.transparent,
                              where: nightstartPage()),
              ],
            ),
          );
  }
}
