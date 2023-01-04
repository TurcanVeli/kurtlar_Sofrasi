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
  //Like a Soup
  @override
  void initState() {
    int max = USERS[0].GetVote;
    int MafiasdeadIndex = 0;
    int AbdulsdeadIndex = -1;
    for (int i = 0; i < USERS.length; i++) {
      if (CloningUser[i].GetMuted) {
        CloningUser[i].SetMuted(false);
      }
      if (CloningUser[i].GetVote >= max) {
        max = CloningUser[i].GetVote;
        MafiasdeadIndex = i;
      }
      if (CloningUser[i].GetHitBullet) {
        AbdulsdeadIndex = i;
      }
      if (CloningUser[i].GetRole.GetName == "Karahanli" &&
          CloningUser[i].GetRole.remainingMission == 0) {
        CloningUser[i].ChosenUser.SetMuted(true);
      }

      CloningUser[i].SetVote(0);
    }
    if (max != 0 && MafiasdeadIndex == AbdulsdeadIndex) {
      CloningUser[AbdulsdeadIndex].setDead();
      DeadUsers.add(USERS[AbdulsdeadIndex]);
      USERS.removeAt(AbdulsdeadIndex);
      GovermentUser.remove(CloningUser[AbdulsdeadIndex]);
      MafiasUser.remove(CloningUser[AbdulsdeadIndex]);
    } else if (max != 0 && MafiasdeadIndex != AbdulsdeadIndex) {
      CloningUser[MafiasdeadIndex].setDead();
      DeadUsers.add(CloningUser[MafiasdeadIndex]);
      USERS.remove(CloningUser[MafiasdeadIndex]);
      GovermentUser.remove(CloningUser[MafiasdeadIndex]);
      MafiasUser.remove(CloningUser[MafiasdeadIndex]);

      if (AbdulsdeadIndex != -1) {
        CloningUser[AbdulsdeadIndex].setDead();
        DeadUsers.add(CloningUser[AbdulsdeadIndex]);
        USERS.remove(CloningUser[AbdulsdeadIndex]);
        GovermentUser.remove(CloningUser[AbdulsdeadIndex]);
        MafiasUser.remove(CloningUser[AbdulsdeadIndex]);
      }
    } else {
      if (AbdulsdeadIndex != -1) {
        CloningUser[AbdulsdeadIndex].setDead();
        DeadUsers.add(CloningUser[AbdulsdeadIndex]);
        USERS.remove(CloningUser[AbdulsdeadIndex]);
        GovermentUser.remove(CloningUser[AbdulsdeadIndex]);
        MafiasUser.remove(CloningUser[AbdulsdeadIndex]);
      }
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
                      buttonText:translate(context).contiune,
                      ContainerColor: Colors.transparent,
                      where: DayStartPage()),
                ],
              ))
        ]);
  }
}
