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
import '../models/users.dart';

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
  firestoreService _store = firestoreService();
  Map<String, dynamic> fetchedUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var inviteCode = TextEditingController();

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

  void deleteUserFromList(Players user) {
    USERS.remove(user);
  }

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
        title: Text('Oyuncu Ekle'),
        leading: IconButton(icon: Icon(Icons.arrow_circle_left_sharp)),
      ),
      body: FutureBuilder(
        future: _store.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data; //Tüm kullanıcılar burada

            return SingleChildScrollView(
              child: Column(children: [
                TextField(
                  controller: inviteCode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Code',
                  ),
                ),
                ElevatedButton(
                  child: Text('ADD'),
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: USERS.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              NetworkImage(USERS[index].GetImageUrl),
                        ),
                       
                        Text(USERS[index].GetName),
                      
                        Column(
                          children: [
                            Text(
                              "Coin",
                              style:
                                  TextStyle(color: ColorConstant.instance.red),
                            ),
                            Text(USERS[index].getCoin.toString())
                          ],
                        ),
                      
                        Column(
                          children: [
                            Text(
                              "Point",
                              style:
                                  TextStyle(color: ColorConstant.instance.red),
                            ),
                            Text(USERS[index].getPoint.toString()),
                            
                          ],
                        ),
                        SizedBox(width: 5,),
                      ],
                    ));
                  },
                ),
                ElevatedButton(
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
