import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/models/players.dart';
import 'package:kurtlar/frontend/pages/night_view.dart';
import 'package:kurtlar/frontend/pages/nightreport_view.dart';
import '../../backend/lang/language_constant.dart';
import '../components/button.dart';
import '../models/users.dart';

//User Alacak ve chosen userı gösterim görevi yapacak.
class missionreportPage extends StatefulWidget {
  int index;
  missionreportPage(this.index);

  @override
  State<missionreportPage> createState() => _missionreportPageState();
}

class _missionreportPageState extends BaseState<missionreportPage> {
  String MissionText;
  Players user;
  @override
  void initState() {
    MissionText = USERS[widget.index].GetRole.DoMission();
    user = USERS[widget.index];
    super.initState();
  }

  List<Players> getInformation() {
    List<Players> mixedInformation = [
      (MafiasUser..shuffle()).first,
      (GovermentUser..shuffle()).first
    ];
    mixedInformation..shuffle();
    return mixedInformation;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/images/night.jpg"), // <-- BACKGROUND IMAGE
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
                height: 200,
              ),
              Row(
                children: <Widget>[
                  MissionText != "Bugünlük iş yok"
                      ? ChosenUserAvatar()
                      : SizedBox(
                          height: 20,
                        ),
                  SizedBox(
                    width: 20,
                  ),
                  user.GetRole.GetName == "Aslan Akbey"
                      ? PolatText()
                      : MissionText != "Bugünlük iş yok"
                          ? completed()
                          : user.GetRole.GetName == "Dogu Bey"
                              ? Dogureport
                              : notcompleted()
                ],
              ),
              SizedBox(
                height: 40,
              ),
              BottomButtonContainerContiune(
                  context: context,
                  height: 50,
                  buttonText: translate(context).ok,
                  where: widget.index < USERS.length - 1
                      ? Night(widget.index)
                      : NightreportPage(),
                  ContainerColor: Colors.transparent)
            ],
          ))
    ]);
  }

  CircleAvatar ChosenUserAvatar() {
    return CircleAvatar(
      radius: 40,
      child: Image.asset('assets/images/deafultAvatar.png'),
    );
  }

  Container Dogureport() => Container(
      child: user.GetRole.chosenUser.Getisdead
          ? user.GetRole.chosenUser.GetHitBullet
              ? Text("Abdulley Vurmuş")
              : Text(
                  "Şu iki kişiden biri öldürmüş => ${getInformation()[0].GetName} or ${getInformation()[1].GetName}") //İki kişi gelcek ve biri kesin mafya olcak
          : Text("Hedefin hala yaşıyor"));

  Container notcompleted() => Container(
        child: Text(MissionText,
            style:
                TextStyle(fontSize: 30, color: ColorConstant.instance.white)),
      );

  Container completed() {
    return Container(
      child: Text(
          "${USERS[widget.index].GetRole.chosenUser.GetName} => ${MissionText}",
          style: TextStyle(fontSize: 30, color: ColorConstant.instance.white)),
    );
  }

  Container PolatText() => Container(
        child: Text("POLAT => ${PolatUser.GetName}",
            style:
                TextStyle(fontSize: 30, color: ColorConstant.instance.white)),
      );
}
