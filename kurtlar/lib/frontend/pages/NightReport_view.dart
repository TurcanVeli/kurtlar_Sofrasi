import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/models/Karahanl%C4%B1.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/pages/Daystart_view.dart';
import 'package:kurtlar/frontend/pages/daylight_view.dart';

import '../components/button.dart';
import '../models/players.dart';
import '../models/users.dart';

class NightreportPage extends StatefulWidget {
  @override
  State<NightreportPage> createState() => _NightreportPageState();
}

class _NightreportPageState extends State<NightreportPage> {
  List<Players> DeadUsers = [];

  @override
  void initState() {
    int max = USERS[0].GetVote;
    Players Mafiasdead = null;
    Players Abduldead = null;
    Players dogu = null;

    for (int i = 0; i < USERS.length; i++) {
      if (USERS[i].GetName == "Doğu Bey"){
        dogu = USERS[i];
      }
      if (USERS[i].GetMuted) {
        USERS[i].setMuted(false);
      }
      if (USERS[i].GetVote >= max) {
        max = USERS[i].GetVote;
        if (max != 0){
          Mafiasdead = USERS[i];
        }
      }
      if (USERS[i].GetHitBullet) {
        Abduldead = USERS[i];
      }
      if (USERS[i].GetRole.GetName == "Karahanli" &&
          USERS[i].GetRole.getRemainmissioncount == 0) {
        USERS[i].GetRole.chosenUser.setMuted(true);
      }

      USERS[i].SetVote(0);
    }
   
    
    if (Abduldead != null){
      DeadUsers.add(Abduldead);
      Abduldead.setDead();
      USERS.remove(Abduldead);
      GovermentUser.remove(Abduldead);
      MafiasUser.remove(Abduldead);
    }
    if(Mafiasdead != null){
      if (Abduldead != Mafiasdead) DeadUsers.add(Mafiasdead);
      Mafiasdead.setDead();
      USERS.remove(Mafiasdead);
      GovermentUser.remove(Mafiasdead);
      MafiasUser.remove(Mafiasdead);
    }
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
              body: Column(
                children: [
                  SizedBox(
                    height: 55,
                  ),
                  Text(
                    "${translate(context).night} ${translate(context).report}",
                    style: TextStyle(
                        fontSize: 30, color: ColorConstant.instance.white),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    height: 500,
                    child: ListView.builder(
                      itemCount: DeadUsers.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(DeadUsers[index].GetName,
                                      style: TextStyle(
                                          color: ColorConstant.instance.white,
                                          fontSize: 15)),
                                  CircleAvatar(
                                    radius: 40,
                                    child: Image.asset(
                                        "assets/images/deafultAvatar.png"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                DeadUsers[index].GetHitBullet
                                    ? translate(context).abdushot
                                    : translate(context).mafiashot,
                                style: TextStyle(
                                    color: ColorConstant.instance.white),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  BottomButtonContainerContiune(
                      context: context,
                      height: 50,
                      buttonText: translate(context).contiune,
                      ContainerColor: Colors.transparent,
                      where: DayStartPage()),
                ],
              ))
        ]);
  }
}
