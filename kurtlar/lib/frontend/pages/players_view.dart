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
  
  Future<String> _getID() async {
    return await GetID();

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oyuncu Ekle'),
        leading: IconButton(icon: Icon(Icons.arrow_circle_left_sharp)),
      
        ),
        body: StreamBuilder <DocumentSnapshot>(
          stream: _firestore.collection("Users").doc().snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if(snapshot.hasData){
              var data = snapshot.data.data();
              print("sad" + data.toString());

              return Text("skjad");
            }
            else{
              return LinearProgressIndicator();
            }
          }, ),
    );
  }
}