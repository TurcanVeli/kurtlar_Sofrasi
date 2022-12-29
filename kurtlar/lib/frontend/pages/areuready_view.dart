import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/components/showingOtherPlayers.dart';

import '../components/ready.dart';
import '../models/players.dart';

//Gece oylama kısmdında hazır mısın ve gündüz hazırmısın sayfası bu olacak.

class areUready extends StatefulWidget {
  Players user;
  List<Players> Users;
  areUready(this.user, this.Users);

  @override
  State<areUready> createState() => _areUreadyState(user, Users);
}

class _areUreadyState extends BaseState<areUready> {
  Players user;
  List<Players> Users;
  _areUreadyState(this.user, this.Users);
  bool ispressed = false;
  bool ready = false; //Hazırsa görev sayfasına
  void setIspressed() {
    setState(() {
      ispressed = !ispressed;
    });
  }

  void setReady() {
    setState(() {
      print("object");
      ready = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ready != false
            ? ListView(children: [
                SizedBox(
                  height: dynamicHeight(0.2),
                ),
                Container(
                    height: dynamicHeight(0.11),
                    child: Center(child: Text(user.GetRole.GetName))),
                Container(
                    height: dynamicHeight(0.11),
                    child: Center(child: Text(user.GetRole.GetRoleDefiniton))),
                UsersShowingContainer(dynamicHeight(0.6), Users)
              ])
            : ReadyComponent(context, user, dynamicHeight, setIspressed,
                ispressed, setReady,"Görevini yapmak istediğin kişiyi seç"));
  }
}
