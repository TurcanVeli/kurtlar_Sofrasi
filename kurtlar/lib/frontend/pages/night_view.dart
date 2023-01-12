import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/components/showingOtherPlayers.dart';
import 'package:kurtlar/frontend/pages/missionreport_view.dart';
import 'package:kurtlar/frontend/pages/nightreport_view.dart';

import '../../backend/lang/language_constant.dart';
import '../components/button.dart';
import '../components/ready.dart';
import '../models/usersAndroles.dart';

//Gece oylama kısmdında hazır mısın ve gündüz hazırmısın sayfası bu olacak.

class Night extends StatefulWidget {
  int j;
  Night(this.j);

  @override
  State<Night> createState() => _NightState(j);
}

class _NightState extends BaseState<Night> {
  int _i;
  _NightState(this._i);

  @override
  void initState() {
    _i = _i + 1;
    super.initState();
  }

  bool _isMission = false;
  bool ispressed = false;
  bool ready = false; //Hazırsa görev sayfasına
  void setIspressed() {
    setState(() {
      ispressed = !ispressed;
    });
  }

  void setReady() {
    setState(() {
      ready = true;
    });
  }

  //Mafya ise oylayacak. devlet ise göre yapacak.
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
                ColorConstant.instance.transparent, // <-- SCAFFOLD WITH TRANSPARENT BG
            body: ready != false
                ? ListView(children: [
                    SizedBox(
                      height: dynamicHeight(0.05),
                    ),
                    Container(
                      height: dynamicHeight(0.11),
                      child: Center(
                        child: Text(
                          USERS[_i].GetRole.GetName,
                          style: TextStyle(
                              color: ColorConstant.instance.white,
                              fontSize: 34),
                        ),
                      ),
                    ),
                    Container(
                      height: dynamicHeight(0.11),
                      child: Center(
                        child: Text(
                          USERS[_i].GetRole.GetTeam == "Mafya"
                              ? translate(context).killsomeone
                              : USERS[_i].GetRole.GetMissionText,
                          style: TextStyle(
                              color: ColorConstant.instance.white,
                              fontSize: 24),
                        ),
                      ),
                    ),
                    //Salak saçma bir kod ama düzeltecem
                    if (USERS[_i].GetRole.GetTeam == "Mafya")
                      Column(
                        children: [
                          UserShowing(dynamicHeight(0.3), GovermentUsers, true,
                              false, USERS[_i]),
                          SizedBox(
                            height: dynamicHeight(0.001),
                          ),
                          Text(
                            USERS[_i].GetRole.GetMissionText,
                            style: TextStyle(
                                color: ColorConstant.instance.white,
                                fontSize: 34),
                          ),
                          if (USERS[_i].GetRole.GetName != "Mafya Adamı" &&
                              USERS[_i].GetRole.getRemainmissioncount != 0)
                            UserShowing(dynamicHeight(0.3), USERS, true,
                                false, USERS[_i])
                          else if (USERS[_i].GetRole.GetName != "Mafya Adamı" &&
                              USERS[_i].GetRole.getRemainmissioncount == 0)
                            Text("görev hakkın bitti",style: TextStyle(
                                color: ColorConstant.instance.Catskill_White,
                                fontSize: 34))
                          else
                            SizedBox(
                              height: dynamicHeight(0.3),
                            )
                        ],
                      )
                    else if (USERS[_i].GetRole.GetTeam == "Derin Devlet" &&
                        USERS[_i].GetRole.GetMissionText !=
                            "No Mission" &&
                        USERS[_i].GetRole.GetName != "Aslan Akbey" &&
                        USERS[_i].GetRole.getRemainmissioncount != 0 && !USERS[_i].GetMuted)
                      UserShowing(
                          dynamicHeight(0.6), USERS, true, true, USERS[_i])
                    else if (USERS[_i].GetRole.GetTeam == "Derin Devlet" &&
                        USERS[_i].GetRole.GetMissionText !=
                            "No Mission" &&
                        USERS[_i].GetRole.GetName != "Aslan Akbey" &&
                        USERS[_i].GetMuted)
                      Text("Susturuldun", style: TextStyle(
                                color: ColorConstant.instance.Catskill_White,
                                fontSize: 34))
                    else
                      SizedBox(
                        height: dynamicHeight(0.6),
                      ),
                    BottomButtonContainerContiune(
                        context: context,
                        height: dynamicHeight(0.07),
                        buttonText: translate(context).ok,
                        where: USERS[_i].GetRole.GetName == "Memur" ||
                                USERS[_i].GetRole.GetName == "Mafya Adamı"
                            ? _i < USERS.length - 1
                                ? Night(_i)
                                : NightreportPage()
                            : missionreportPage(_i),
                        ContainerColor: ColorConstant.instance.transparent)
                  ])
                : ReadyComponent(
                    context,
                    USERS[_i],
                    dynamicHeight,
                    setIspressed,
                    ispressed,
                    setReady,
                    translate(context).readyformission,
                    true),
          )
        ]);
  }
}
