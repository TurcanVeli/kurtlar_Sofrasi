import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/components/showingOtherPlayers.dart';
import 'package:kurtlar/frontend/pages/nightreport_view.dart';

import '../../backend/lang/language_constant.dart';
import '../components/button.dart';
import '../components/ready.dart';
import '../models/users.dart';

//Gece oylama kısmdında hazır mısın ve gündüz hazırmısın sayfası bu olacak.

class areUready extends StatefulWidget {
  int j;
  areUready(this.j);

  @override
  State<areUready> createState() => _areUreadyState(j);
}

class _areUreadyState extends BaseState<areUready> {
  int _i;
  _areUreadyState(this._i);

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
                Colors.transparent, // <-- SCAFFOLD WITH TRANSPARENT BG
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
                              : USERS[_i].GetRole.GetName == "Aslan Akbey"
                                  ? "Polat => ${PolatUser.GetName}"
                                  : USERS[_i].GetRole.GetMissionText,
                          style: TextStyle(
                              color: ColorConstant.instance.white,
                              fontSize: 34),
                        ),
                      ),
                    ),
                    //Salak saçma bir kod ama düzeltecem
                    if (USERS[_i].GetRole.GetTeam == "Mafya")
                      Column(children: [
                         UserShowing(dynamicHeight(0.3), GovermentUser, true,
                          false, false, USERS[_i]),
                          SizedBox(height: dynamicHeight(0.001),),
                          Text( USERS[_i].GetRole.GetMissionText, style: TextStyle(
                              color: ColorConstant.instance.white,
                              fontSize: 34),),
                           if(USERS[_i].GetRole == "Mafya Adamı")
                            UserShowing(dynamicHeight(0.3), GovermentUser, true,
                            false, true, USERS[_i])
                          else
                          SizedBox(height: dynamicHeight(0.3),)
                      ],)
                     

                    
                      
                     
                    else if (USERS[_i].GetRole.GetMissionText !=
                            translate(context).noduty &&
                        USERS[_i].GetRole.GetName != "Aslan Akbey")
                      if (USERS[_i].GetRole.GetName == "Dogu Bey" &&
                          USERS[_i].GetRole.getRemainmissioncount == 0)
                        Container(
                          height: dynamicHeight(0.6),
                          child: Text(
                            USERS[_i].GetRole.ChosenUser.Getisdead &&
                                    !USERS[_i].GetRole.ChosenUser.GetHitBullet
                                ? "${translate(context).suspects}: ${USERS[_i].GetRole.ChosenUser}"
                                : USERS[_i].GetRole.ChosenUser.Getisdead &&
                                        USERS[_i]
                                            .GetRole
                                            .ChosenUser
                                            .GetHitBullet
                                    ? "${USERS[_i].GetRole.ChosenUser.GetName} ${translate(context).bullet}"
                                    : "${USERS[_i].GetRole.ChosenUser.GetName} ${translate(context).alive}",
                            style: TextStyle(color: ColorConstant.instance.red),
                          ),
                        )
                      else
                        UserShowing(dynamicHeight(0.6), USERS, true, false,
                            true, USERS[_i])
                    else
                      SizedBox(
                        height: dynamicHeight(0.6),
                      ),
                    BottomButtonContainerContiune(
                        context: context,
                        height: dynamicHeight(0.07),
                        buttonText:translate(context).ok,
                        where: _i < USERS.length - 1
                            ? areUready(_i)
                            : NightreportPage(),
                        ContainerColor: Colors.transparent)
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
