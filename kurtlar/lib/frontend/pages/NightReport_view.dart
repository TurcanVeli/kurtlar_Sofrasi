import 'package:flutter/material.dart';
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
    int MafiasdeadIndex = 0;
    int AbdulsdeadIndex = -1;
    for (int i = 0; i < USERS.length; i++) {
      if (CloningUser[i].GetVote >= max) {
        max = CloningUser[i].GetVote;
        MafiasdeadIndex = i;
      }
      if (CloningUser[i].GetHitBullet) {
        AbdulsdeadIndex = i;
      }
    }
    if (max != 0 && MafiasdeadIndex == AbdulsdeadIndex) {
      CloningUser[AbdulsdeadIndex].setDead();
      DeadUsers.add(USERS[AbdulsdeadIndex]);
      USERS.removeAt(AbdulsdeadIndex);

    } else if (max != 0 && MafiasdeadIndex != AbdulsdeadIndex) {
      CloningUser[MafiasdeadIndex].setDead();
      DeadUsers.add(CloningUser[MafiasdeadIndex]);
      USERS.remove(CloningUser[MafiasdeadIndex]);
      if (AbdulsdeadIndex != -1) {
        CloningUser[AbdulsdeadIndex].setDead();
        DeadUsers.add(CloningUser[AbdulsdeadIndex]);
        USERS.remove(CloningUser[AbdulsdeadIndex]);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Text(
          "Gece Olanlar",
          style: TextStyle(fontSize: 30),
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
                        CircleAvatar(
                          radius: 40,
                          child: Image.asset("assets/images/deafultAvatar.png"),
                        ),
                        Text(DeadUsers[index].GetName)
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(DeadUsers[index].GetHitBullet
                        ? "Gecele karanlığında uzun"
                          "saçlı bir adam tarafından vuruldu."

                        : "Mafya tarafından öldürüldü")
                  ],
                ),
              );
            }),
          ),
        ),
        BottomButtonContainerContiune(
            height: 50,
            buttonText: "Devam",
            ContainerColor: Colors.white,
            where: DayStartPage()),
      ],
    ));
  }
}
