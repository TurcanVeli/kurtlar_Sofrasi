
import 'package:flutter/material.dart';

import '../base/color_constants.dart';
import '../pages/home_view.dart';
import 'button.dart';
Column gameOver(bool isMafiaWin) {
    return Column(
                    children: [
                      Expanded(flex:1,child: SizedBox()),
                      if(isMafiaWin)
                      Expanded(
                        flex:10,
                        child: Container(
                            child: Center(
                                child: Text(
                                    "mafya kazandı ve mafya üyeleri 50 gold ve 30 puan kazandı.",
                                    style: TextStyle(
                                        color: ColorConstant.instance.white,
                                        fontSize: 40)))),
                      )
                      else
                      Expanded(
                        flex:10,
                        child: Container(
                            child: Center(
                                child: Text(
                                    "Derin Devlet kazandı ve Derin Devlet üyeleri 50 gold ve 30 puan kazandı.",
                                    style: TextStyle(
                                        color: ColorConstant.instance.white,
                                        fontSize: 40)))),
                      ),

                      Expanded(flex: 1,child: SizedBox(height:50)),
                       Expanded(flex:1,child: BottomButtonContainerContiune(where: Home(),ContainerColor: Colors.transparent,color: ColorConstant.instance.red,buttonText: "AnaSayfaya Dön"))
                    ],
                  );
  }