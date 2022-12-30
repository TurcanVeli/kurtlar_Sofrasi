import 'package:flutter/material.dart';
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
              backgroundColor: ispressed ? Colors.red : Colors.white,
              child: CircleAvatar(
                child: Image.asset("assets/images/deafultAvatar.png"),
                maxRadius: 100,
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
                style: TextStyle(color: isNight ? Colors.white : Colors.black),
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
                      TextStyle(color: isNight ? Colors.white : Colors.black)),
            ))),
        SizedBox(
          height: dynamicHeight(0.07),
        ),
        if (ispressed)
          Container(
              height: dynamicHeight(0.07),
              color: Colors.red,
              child: ElevatedButton(onPressed: go, child: Text("Hazır")))
        else
          SizedBox(
            height: 0.07,
          )
      ],
    ),
  );
}
