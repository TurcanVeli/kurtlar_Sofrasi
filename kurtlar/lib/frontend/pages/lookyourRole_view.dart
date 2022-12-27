import 'package:flutter/material.dart';
import 'package:kurtlar/backend/models/users.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/models/players.dart';
import 'package:kurtlar/frontend/pages/roles_view.dart';

import '../components/button.dart';

class YourRole extends StatefulWidget {
  List<Players> users;
  YourRole(users);
  @override
  State<YourRole> createState() => _YourRoleState();
}

class _YourRoleState extends BaseState<YourRole> {


  bool ispressed = false;
  void setIspressed() {
   setState(() {
      ispressed = !ispressed;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
           SizedBox(height: dynamicHeight(0.16),),
            GestureDetector(
                onTap: setIspressed,
                child: Container(
                  height: dynamicHeight(0.28),
                  
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor:  ispressed == true ? Colors.red : Colors.white,
                    child: CircleAvatar(
                       
                      child: Image.asset("assets/images/deafultAvatar.png"),
                      maxRadius: 100,
                    ),
                  ),
                ),
              ),
            
            Container(height: dynamicHeight(0.2),child: Center(child: Padding(
              padding: EdgeInsets.only(bottom: 90),
              child: Text("UserName"),
            ))),
            Container(height: dynamicHeight(0.2),child: Center(child: Padding(
              padding: EdgeInsets.only(bottom: 90),
              child: Text("OKayiz"),
            ))),
            SizedBox(height: dynamicHeight(0.07),),
            if (ispressed) BottomButtonContainerContiune(context: context,height:dynamicHeight(0.07),buttonText: "DEVAM",where: rolesPage() ) else SizedBox(height: 0.07,) ],
        ),
      ),
    );
  }
}
