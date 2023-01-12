import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/models/players.dart';

Center ReadyComponent(
    BuildContext context,
    Players user,
    Function dynamicHeight,
    VoidCallback setIspressed,
    bool ispressed,
    VoidCallback go,
    String Body,
    bool isNight) {
  return Center(
    child: ListView(
      children: <Widget>[
        SizedBox(
          height: dynamicHeight(0.16),
        ),
        GestureDetector(
          onTap: setIspressed,
          child: Container(
            height: dynamicHeight(0.26),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: ispressed ? ColorConstant.instance.red : ColorConstant.instance.white,
              child: CircleAvatar(
                maxRadius: 95,
                minRadius: 70,
                backgroundImage: NetworkImage(user.GetImageUrl),
                
              ),
            ),
          ),
        ),

        //Gece readyisinde bu container olmayacak
        Container(
            height: dynamicHeight(0.2),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(bottom: 90),
              child: Text(
                user.GetName,
                style: TextStyle(color: isNight ? ColorConstant.instance.white : ColorConstant.instance.black),
              ),
            ))),

        //Gece readysinde burada göre yazacak.
        Container(
            height: dynamicHeight(0.2),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(bottom: 90),
              child: Text(Body,
                  style:
                      TextStyle(color: isNight ? ColorConstant.instance.white :ColorConstant.instance.black,fontSize: 20)),
            ))),
        SizedBox(
          height: dynamicHeight(0.07),
        ),
        if (ispressed)
          Container(
            height: dynamicHeight(0.07),
            color: ColorConstant.instance.red,
            child: ElevatedButton(
              onPressed: go,
              child: Text(translate(context).ready),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorConstant.instance.red),
              ),
            ),
          )
        else
          SizedBox(
            height: 0.07,
          )
      ],
    ),
  );
}
