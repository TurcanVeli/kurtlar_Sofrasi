import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';
import 'package:kurtlar/backend/service/auth.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with CacheID {
  AuthService _auth = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var inviteCode  = TextEditingController();

  
  Map<String,dynamic> findUserByUsingInviteCode(List data, String code){
      for (int i = 0; i< data.length; i++){
              print(data[i]);
              print("smfdlsdöf");
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
        future: _auth.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data  =snapshot.data;
           
            return Column(
              children: [
                TextField(
                  controller: inviteCode ,
                  
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
