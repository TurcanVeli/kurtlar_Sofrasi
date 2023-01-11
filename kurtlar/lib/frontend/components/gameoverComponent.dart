

import 'package:flutter/material.dart';
import 'package:kurtlar/backend/service/firestoreService.dart';
import 'package:kurtlar/frontend/models/users.dart';

import '../../backend/lang/language_constant.dart';
import '../base/color_constants.dart';
import '../pages/home_view.dart';
import 'button.dart';

Future<bool> updateUsers(bool isMafiaWin) async {
  firestoreService _store = firestoreService();
  if (isMafiaWin == true) {
    for (int i = 0; i < CloningUser.length; i++) {
      if (CloningUser[i].GetRole.GetTeam == "Mafya") {
        await _store.IncementUserCoin(
            CloningUser[i].GetuserID, CloningUser[i].getCoin);
        await _store.IncrementUserPoint(
            CloningUser[i].GetuserID, CloningUser[i].getPoint);
      }
    }
  } else {
    for (int i = 0; i < CloningUser.length; i++) {
      if (CloningUser[i].GetRole.GetTeam == "Derin Devlet") {
        await _store.IncementUserCoin(
            CloningUser[i].GetuserID, CloningUser[i].getCoin);
        await _store.IncrementUserPoint(
            CloningUser[i].GetuserID, CloningUser[i].getPoint);
      }
    }
  }
  return true;
}

  Column gameOver(bool isMafiaWin, BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        if (isMafiaWin)
          Expanded(
            flex: 10,
            child: Container(
                child: Center(
                    child: Text(translate(context).mafiawin,
                        style: TextStyle(
                            color: ColorConstant.instance.white,
                            fontSize: 40)))),
          )
        else
          Expanded(
            flex: 10,
            child: Container(
                child: Center(
                    child: Text(translate(context).govwin,
                        style: TextStyle(
                            color: ColorConstant.instance.white,
                            fontSize: 40)))),
          ),
        Expanded(flex: 1, child: SizedBox(height: 50)),
        Expanded(
            flex: 1,
            child: BottomButtonContainerContiune(
              context: context,
                where: Home(),
                ContainerColor: Colors.transparent,
                color: ColorConstant.instance.red,
                buttonText: translate(context).backhomepage))
      ],
    );
  }