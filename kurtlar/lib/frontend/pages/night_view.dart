import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/components/showingOtherPlayers.dart';
import 'package:kurtlar/frontend/pages/NightReport_view.dart';

import '../components/button.dart';
import '../components/ready.dart';
import '../models/players.dart';
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
                      USERS[_i].GetRole.GetTeam == "Mafya"?"Kimi Öldürmek İstiyorsun"
                      :USERS[_i].GetRole.GetName == "Aslan Akbey"?"Polat => ${PolatUser.GetName}":USERS[_i].GetRole.GetMissionText,
                      style: TextStyle(color: ColorConstant.instance.red, fontSize: 34),
                    ))),
                if (USERS[_i].GetRole.GetTeam == "Mafya")      
                  UserShowing(dynamicHeight(0.6), GovermentUser, true, false, false,USERS[_i])
                
                
                else
                  if(USERS[_i].GetRole.GetMissionText != "Görevin Yok"&& USERS[_i].GetRole.GetName != "Aslan Akbey")
                    if (USERS[_i].GetRole.GetName == "Dogu Bey" && USERS[_i].GetRole.getRemainmissioncount == 0)
                        Container(
                          height: dynamicHeight(0.6),
                          child: Text(USERS[_i].GetRole.ChosenUser.Getisdead && !USERS[_i].GetRole.ChosenUser.GetHitBullet ? "Şüpheliler: ${USERS[_i].GetRole.ChosenUser}"
                          :USERS[_i].GetRole.ChosenUser.Getisdead && USERS[_i].GetRole.ChosenUser.GetHitBullet?"${USERS[_i].GetRole.ChosenUser.GetName} kafasına bir mermi yemiş": "${USERS[_i].GetRole.ChosenUser.GetName} hala yaşıyor"
                          , style: TextStyle(color: ColorConstant.instance.red),),
                        )

                    else
                      UserShowing(dynamicHeight(0.6), USERS, true, false, true,USERS[_i])
                  else
                    SizedBox(height: dynamicHeight(0.6),),
                BottomButtonContainerContiune(
                    context: context,
                    height: dynamicHeight(0.07),
                    buttonText: "TAMAM",
                    where: _i < USERS.length-1 ? areUready(_i) : NightreportPage(),
                    ContainerColor: Colors.black)
              ])
            : ReadyComponent(context, USERS[_i], dynamicHeight, setIspressed,
                ispressed, setReady, "Görevini Yapmak İçin Hazıra Tıkla", true));
  }
}
