// create sayfasi
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/pages/nightstart_view.dart';

import '../models/users.dart';

class create extends StatefulWidget {
  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {

  @override

  //initleri muhteşem kullanıyorum uygulama patlatabiilir mi acaba bilmiyorum
  void initState() {
    Role randomRole;
   
    for (int l = 0; l<USERS.length; l++){
    
      randomRole = (addedRoles..shuffle()).first;
      USERS[l].SetRole(randomRole);
      if(randomRole.GetTeam == "Mafya") MafiasUser.add(USERS[l]);
      else{
        if (randomRole.GetName == "Polat"){
          PolatUser = USERS[l]; 
        }

          GovermentUser.add(USERS[l]);
      } 
      addedRoles.removeAt(0);
    }

    
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
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
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => nightstartPage()));
                  },
                  child: Text(translate(context).ready),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    primary: Colors.black,
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
