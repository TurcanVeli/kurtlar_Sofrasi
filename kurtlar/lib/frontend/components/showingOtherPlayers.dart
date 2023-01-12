import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/models/usersAndroles.dart';

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
    /* This function is for voting of mafia */

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
                    if (index == selectedUser) {
                      widget._user.GetRole.SetchosenUser(null);
                      selectedUser = -1;
                      widget._user.setDidYouGetInfos(false);
                    } else {
                      selectedUser = index;
                      widget._user.GetRole
                          .SetchosenUser(widget.Users[selectedUser]);
                      widget._user.setDidYouGetInfos(true);
                    }
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: selectedUser == index
                            ? ColorConstant.instance.red
                            : Colors.transparent,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(widget.Users[index].GetImageUrl),
                        ),
                      ),
                      Text(widget.Users[index].GetName,
                          style: TextStyle(
                              color: ColorConstant.instance.white,
                              fontWeight: FontWeight.bold)),

                      /* This is designed for only mission of polat */
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
