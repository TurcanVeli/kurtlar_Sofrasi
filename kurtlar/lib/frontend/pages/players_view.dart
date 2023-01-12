import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/service/auth.dart';
import 'package:kurtlar/backend/service/firestoreService.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:kurtlar/frontend/pages/roles_view.dart';
import 'package:kurtlar/frontend/components/alert_dialog.dart';

import '../models/players.dart';
import '../models/usersAndroles.dart';

/* We are going to use invite code in order to call person in this page */
/* Firstly, we are going to check invite code in database. 
 * If there is a invite code that we search in database, 
 * we are going the fetch the information of the person who have this invite code   
 * Finally, this information will be displayed in this page */

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with CacheID {
  /* FiresetoreService and FirebaseStore was initialized in here */
  firestoreService _store = firestoreService();
  Map<String, dynamic> fetchedUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var inviteCode = TextEditingController();

  /* We are going to add the user to list in order to show in body page */
  bool addUsertoList(Map<String, dynamic> User) {
    Players user = Players(User["userName"], User["id"], User["image"],
        User["coin"], User["point"], User["invitecode"]);
    for (int i = 0; i < USERS.length; i++) {
      if (USERS[i].GetCode == user.GetCode) {
        return false;
      }
    }
    USERS.add(user);
    return true;
  }

  /* This function delete the user from the list */
  void deleteUserFromList(Players user) {
    USERS.remove(user);
  }

  /* This function is going to find User by using ınvite code 
  * This function is going to check there is person who matches this code */
  Map<String, dynamic> findUserByUsingInviteCode(List data, String code) {
    for (int i = 0; i < data.length; i++) {
      if (data[i]['invitecode'] == code) {
        return data[i];
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Oyuncu Ekle',
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left_sharp, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: _store.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data; //Tüm kullanıcılar burada

            return SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: inviteCode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Code',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ColorConstant.instance.red),
                  child: Text(translate(context).addpPLayer),
                  onPressed: () {
                    fetchedUser =
                        findUserByUsingInviteCode(data, inviteCode.text);
                    inviteCode.clear();
                    if (fetchedUser == null) {
                      showDialog(
                          context: context,
                          builder: (BuildContext buildercontext) {
                            return dialog(
                                context, "Warning", "Invitecode is not found");
                          });
                    }
                    bool isAdded = addUsertoList(fetchedUser);
                    if (!isAdded) {
                      showDialog(
                          context: context,
                          builder: (BuildContext buildercontext) {
                            return dialog(context, "Warning",
                                "You cannot add same user again");
                          });
                    }
                    setState(() {});
                  },
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: USERS.length,
                  itemBuilder: (context, index) {
                    return Card(
                        margin: EdgeInsets.all(10),
                        elevation: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black,
                                        spreadRadius: 1 / 2)
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      NetworkImage(USERS[index].GetImageUrl),
                                ),
                              ),
                            ),
                            Text(
                              USERS[index].GetName,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Coin",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                      decorationThickness: 2,
                                      color: ColorConstant.instance.red,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(USERS[index].getCoin.toString())
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Point",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2,
                                      color: ColorConstant.instance.red,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(USERS[index].getPoint.toString()),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    deleteUserFromList(USERS[index]);
                                  });
                                },
                                icon: Icon(
                                  Icons.cancel,
                                  size: 25,
                                ))
                          ],
                        ));
                  },
                ),

                /* This is the contiune button */
                SizedBox(height: 500),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.instance.red),
                    onPressed: (() {
                      if (USERS.length < 3) {
                        showDialog(
                            context: context,
                            builder: (BuildContext buildercontext) {
                              return dialog(context, "Warning",
                                  "You cannot play with less than 3 player");
                            });
                      } else {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => rolesPage()));
                      }
                    }),
                    child: Text(translate(context).contiune))
              ]),
            );
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
