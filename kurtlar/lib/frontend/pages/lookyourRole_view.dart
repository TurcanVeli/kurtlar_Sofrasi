import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/models/players.dart';
import 'package:kurtlar/frontend/models/users.dart';
import 'package:kurtlar/frontend/pages/night_view.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/login_view.dart';
import 'package:kurtlar/frontend/pages/nightstart_view.dart';
import 'package:kurtlar/frontend/pages/roles_view.dart';

import '../components/alert_dialog.dart';
import '../components/button.dart';
import '../components/ready.dart';
import '../components/showingOtherPlayers.dart';

class YourRole extends StatefulWidget {
  int i;
  Players _user;
  YourRole(this._user, this.i);
  @override
  State<YourRole> createState() => _YourRoleState(_user, i);
}

class _YourRoleState extends BaseState<YourRole> {
  int i;
  Players _user;
  _YourRoleState(this._user, this.i);
  bool ispressed = false;
  bool showrole = false;


  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Oyunu bitirmek istiyor musun'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => {
               Navigator.pop(context,true),
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()),)
            },
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }




  @override
  void initState() {
    i = i+1;
    super.initState();
  }

  void setIspressed() {
    setState(() {
      ispressed = !ispressed;
    });
  }

  void setShowrole() {
    setState(() {
      showrole = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: showrole
            ? ListView(
               
                children: [
                  SizedBox(
                    height: dynamicHeight(0.2),
                  ),
                  Container(
                      height: dynamicHeight(0.11),
                      child: Center(child: Text(_user.GetRole.GetName))),
                  Container(
                      height: dynamicHeight(0.11),
                      child: Center(child: Text(_user.GetRole.GetRoleDefiniton))),
                  
                  //Mafya ya da aslan akbey ise kullanıcılar gözükecek.
                  if (_user.GetRole.GetTeam == "Mafya")
                      
                     UserShowing(dynamicHeight(0.4),MafiasUser,false,true,false,_user)//değiştir
                  else 
                      SizedBox(
                      height: dynamicHeight(0.4),
                      ),
                  
                  BottomButtonContainerContiune(
                      context: context,
                      height: dynamicHeight(0.07),
                      buttonText: "TAMAM",
                      where:
                          i < USERS.length ? YourRole(USERS[i], i) : nightstartPage())
                ],
              )
            :ReadyComponent(context,_user,dynamicHeight,setIspressed,ispressed,setShowrole,"Rolünü Görmek için tıkla",false)
,
      ),
    );
  }
}

