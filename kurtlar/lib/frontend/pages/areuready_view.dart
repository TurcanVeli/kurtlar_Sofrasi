import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/components/showingOtherPlayers.dart';
import 'package:kurtlar/frontend/pages/report_view.dart';

import '../components/button.dart';
import '../components/ready.dart';
import '../models/players.dart';
import '../models/users.dart';

//Gece oylama kısmdında hazır mısın ve gündüz hazırmısın sayfası bu olacak.

class areUready extends StatefulWidget {
  int i;
  areUready(this.i);

  @override
  State<areUready> createState() => _areUreadyState(i);
}

class _areUreadyState extends BaseState<areUready> {
  int i;
  _areUreadyState(this.i);

  @override
  void initState() {
    i = i + 1;
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
    return Scaffold(
        backgroundColor: Colors.black,
        body: ready != false
            ? ListView(children: [
                SizedBox(
                  height: dynamicHeight(0.1),
                ),
                Container(
                    height: dynamicHeight(0.11),
                    child: Center(
                        child: Text(
                      USERS[i].GetRole.GetTeam == "Mafya"?"Kimi Öldürmek İstiyorsun":USERS[i].GetRole.GetMissionText,
                      style: TextStyle(color: Colors.white),
                    ))),
                if (USERS[i].GetRole.GetTeam == "Mafya")
                  UserShowing(dynamicHeight(0.6), GovermentUser, true, false, false)
                else
                  if(USERS[i].GetRole.GetMissionText != "Görevin Yok")
                    UserShowing(dynamicHeight(0.6), USERS, true, false, true)
                  else
                    SizedBox(),
                BottomButtonContainerContiune(
                    context: context,
                    height: dynamicHeight(0.07),
                    buttonText: "TAMAM",
                    where: i < USERS.length ? areUready(i) : reportPage())
              ])
            : ReadyComponent(context, USERS[i], dynamicHeight, setIspressed,
                ispressed, setReady, "oylamak istediğin kişiyi seç", true));
  }
}
