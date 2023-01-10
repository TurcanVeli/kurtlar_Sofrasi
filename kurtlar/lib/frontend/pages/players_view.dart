import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';
import 'package:kurtlar/backend/service/auth.dart';
import 'package:kurtlar/backend/service/firestoreService.dart';

import '../models/players.dart';
import '../models/users.dart';

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

  void addUsertoList(String username) {
    USERS.add(Players(username));
  }

  Map<String, dynamic> findUserByUsingInviteCode(List data, String code) {
    for (int i = 0; i < data.length; i++) {
      if (data[i]['invitecode'] == code) {
        return data[i];
      }
    }
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

            return Column(
              children: [
                TextField(
                  controller: inviteCode,
                )
              ],
            );
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
