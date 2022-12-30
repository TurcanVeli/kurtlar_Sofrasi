import 'package:flutter/material.dart';

import '../models/players.dart';

class UserShowing extends StatefulWidget {
  double height;
  List<Players> Users;
  bool isNight;
  bool inshowingRolePage;
  bool isMission; //Görev değilse oylama;
  UserShowing(this.height, this.Users, this.isNight, this.inshowingRolePage, this.isMission);

  @override
  State<UserShowing> createState() => _UserShowingState();
}

class _UserShowingState extends State<UserShowing> {
  int selectedUser = -1;
  bool didMission = false;


  @override
  void dispose() {
    if (!widget.isMission){
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
                  if (!widget.inshowingRolePage) {
                    setState(() {
                      if (!didMission && widget.isMission){
                          selectedUser = index;
                          didMission = true;

                      }else if(!widget.isMission){
                            selectedUser = index;
                      }
                    });
                  }
                },
                child: Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: selectedUser == index
                            ? Colors.red
                            : widget.isNight
                                ? Colors.black
                                : Colors.white,
                        child: CircleAvatar(
                          radius: 40,
                          child: Image.asset('assets/images/deafultAvatar.png'),
                        ),
                      ),
                      Text(widget.Users[index].GetName,
                          style: TextStyle(
                              color: widget.isNight
                                  ? Colors.white
                                  : Colors.black)),
                      if (widget.inshowingRolePage)
                        SizedBox()
                      
                      //Sadece polatın görevi için tasarlandı
                      else
                        if(!widget.isMission)
                          Text(
                            selectedUser == index
                                ? (widget.Users[index].GetVote + 1).toString()
                                : widget.Users[index].GetVote.toString(),
                            style: TextStyle(
                                color: widget.isNight
                                    ? Colors.white
                                    : Colors.black))
                        else
                          Text(
                              selectedUser == index
                                  ? widget.Users[index].GetRole.GetTeam
                                  :"",
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
