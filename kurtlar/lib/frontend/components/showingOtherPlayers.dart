import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/models/users.dart';

import '../models/players.dart';

class UserShowing extends StatefulWidget {
  double height;
  Players _user;
  List<Players> Users;
  bool isNight;

  bool isMission; //Görev değilse oylama;
  UserShowing(
      this.height, this.Users, this.isNight, this.isMission, this._user);

  @override
  State<UserShowing> createState() => _UserShowingState();
}

class _UserShowingState extends State<UserShowing> {
  int selectedUser = -1;

  @override
  void dispose() {
    //Mafya Oylaması için
    if (!widget.isMission) {
      widget.Users[selectedUser].incrementVote();
    }
 

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: 4 / 6,
                crossAxisSpacing: 34,
                mainAxisSpacing: 34),
            itemCount: widget.Users.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedUser = index;
                     widget._user.GetRole.setChosenUser(widget.Users[selectedUser]);
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: selectedUser == index
                            ? Colors.red
                            : Colors.transparent,
                        child: CircleAvatar(
                          radius: 40,
                          child: Image.asset('assets/images/deafultAvatar.png'),
                        ),
                      ),
                      Text(widget.Users[index].GetName,
                          style: TextStyle(
                              color: ColorConstant.instance.white,
                              fontWeight: FontWeight.bold)),

                      //Sadece polatın görevi için tasarlandı
                      if (!widget.isMission)
                        Text(
                            widget.isNight
                                ? selectedUser == index
                                    ? (widget.Users[index].GetVote + 1)
                                        .toString()
                                    : widget.Users[index].GetVote.toString()
                                : "",
                            style:
                                TextStyle(color: ColorConstant.instance.white))
                      else
                        Text("",
                            style: TextStyle(
                                color: widget.isNight
                                    ? Colors.white
                                    : Colors.black)),
                    ],
                  ),
                ),
              );
            }));
  }
}
