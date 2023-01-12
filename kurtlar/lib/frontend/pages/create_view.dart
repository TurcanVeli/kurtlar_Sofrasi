// create sayfasi
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/models/BaseRole.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/pages/nightstart_view.dart';

import '../models/usersAndroles.dart';

class create extends StatefulWidget {
  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
  @override

  /* Roles will be distributed in here */ 
 /* And these roles will be distributed according to how many person enter the game */
  void initState() {
    Role randomRole;

    for (int l = 0; l < USERS.length; l++) {
      randomRole = (addedRoles..shuffle()).first;
      USERS[l].SetRole(randomRole);
      if (randomRole.GetTeam == "Mafya")
        MafiasUsers.add(USERS[l]);
      else {
        if (randomRole.GetName == "Polat") {
          PolatUser = USERS[l];
        }

        GovermentUsers.add(USERS[l]);
      }
      addedRoles.removeAt(0);
    }
   

    super.initState();
  }

 /* This widget drawns the create page */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.instance.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: ColorConstant.instance.black,
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(70),
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/images/Desk.png',
                  )),
              Container(
                width: 1000,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  "Kur",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Text(
                    translate(context).story_1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => nightstartPage()));
                  },
                  child: Text(translate(context).ready),
                  style: TextButton.styleFrom(
                    backgroundColor: ColorConstant.instance.red,
                    primary: ColorConstant.instance.black,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
