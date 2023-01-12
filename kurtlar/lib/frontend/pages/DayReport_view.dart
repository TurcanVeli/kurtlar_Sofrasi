import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:kurtlar/frontend/models/players.dart';
import 'package:kurtlar/frontend/pages/nightstart_view.dart';


import '../models/usersAndroles.dart';

//Gündüz oylamaları silinecek. Mafyanın görevleri işleyecek. Özellikle nizamettin
class DayLightreport extends StatefulWidget {
  @override
  State<DayLightreport> createState() => _DayLightreportState();
}

class _DayLightreportState extends BaseState<DayLightreport> {
  bool iJail = false;
  int deadindex = -1;
  Players jailed = null;
  //berabere oy durumununda kimse hapise girmeyecek.Sonra yazılacak bu durum
  @override
  void initState() {
    int index = 0;
    int max = USERS[index].GetVote;
    for (int i = 0; i < USERS.length; i++) {
      if (USERS[i].GetVote >= max) {
        max = USERS[i].GetVote;
        if (max != 0) {
          jailed = USERS[i];
        }
      }
      USERS[i].SetVote(0);
    }
    if (jailed != null) {
      if (!jailed.GetSaving){
      jailed.setDead();
      USERS.remove(jailed);
      //Burada ve nightreportta ölenin hangi takımda oluğ olmadığı kontrol edilmeli ve ona göre listelerden çıkartılmalı
      GovermentUsers.remove(jailed);
      MafiasUsers.remove(jailed);
      iJail = true;

      }else{
        jailed.setSaving(false);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.black,
      // <-- SCAFFOLD WITH TRANSPARENT BG
      body: iJail
          ? Container(
              color: ColorConstant.instance.transparent,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(translate(context).judge_1,
                        style: TextStyle(
                            color: ColorConstant.instance.white, fontSize: 15)),
                    SizedBox(
                      height: 150,
                    ),
                    Text(jailed.GetName,
                        style: TextStyle(
                            color: ColorConstant.instance.white, fontSize: 15)),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(jailed.GetImageUrl),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    BottomButtonContainerContiune(
                        context: context,
                        buttonText: translate(context).contiune,
                        color: ColorConstant.instance.red,
                        ContainerColor: ColorConstant.instance.transparent,
                        where: nightstartPage()),
                  ],
                ),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: dynamicHeight(0.1),
                ),
                Container(
                    child: Center(
                        child: Text(
                  "${translate(context).votes}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: ColorConstant.instance.Catskill_White,
                      ),
                ))),
                SizedBox(
                  height: dynamicHeight(0.1),
                ),
                Container(
                  height: dynamicHeight(0.3),
                  child: Center(
                      child: Text(
                    "${translate(context).nojail} ",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: ColorConstant.instance.Catskill_White),
                  )),
                ),
                SizedBox(
                  height: dynamicHeight(0.3),
                ),
                BottomButtonContainerContiune(
                    context: context,
                    height: dynamicHeight(0.08),
                    buttonText: translate(context).contiune,
                    color: ColorConstant.instance.red,
                    ContainerColor: ColorConstant.instance.transparent,
                    where: nightstartPage()),
              ],
            ),
    );
  }
}
