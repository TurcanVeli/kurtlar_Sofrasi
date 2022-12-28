import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/models/players.dart';
import 'package:kurtlar/frontend/models/users.dart';
import 'package:kurtlar/frontend/pages/roles_view.dart';

import '../components/button.dart';

class YourRole extends StatefulWidget {
  @override
  State<YourRole> createState() => _YourRoleState();
}

class _YourRoleState extends BaseState<YourRole> {
  bool ispressed = false;
  bool showrole = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  void setIspressed() { 
    setState(() {
      ispressed = !ispressed;
    });
  }
  void setShowrole(){
    setState(() {
      showrole = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                  backgroundColor:
                      ispressed == true ? Colors.red : Colors.white,
                  child: CircleAvatar(
                    child: Image.asset("assets/images/deafultAvatar.png"),
                    maxRadius: 100,
                  ),
                ),
              ),
            ),
            Container(
                height: dynamicHeight(0.2),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: 90),
                  child: Text(USERS[0].GetName),
                ))),
            Container(
                height: dynamicHeight(0.2),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: 90),
                  child: Text("OKayiz"),
                ))),
            SizedBox(
              height: dynamicHeight(0.07),
            ),
            if (ispressed)
              BottomButtonContainerContiune(
                  context: context,
                  height: dynamicHeight(0.07),
                  buttonText: "ROLÜ GÖSTER",
                  where: rolesPage())
            else
              SizedBox(
                height: 0.07,
              )
          ],
        ),
      ),
    );
  }
}
