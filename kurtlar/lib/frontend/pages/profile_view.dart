import 'package:flutter/material.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kurtlar/backend/service/ImageSevice.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';

//Edit profile ui değişikliği yapılacak

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with CacheID {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImageService _image = ImageService();
  
  Future FetchUser() async {
    var userId = await GetID();
    var ref = _firestore.collection("Users").doc(userId);

    var data = ref.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data;
      },
      onError: (e) {
        print("Error getting document: $e");
        return null;
      },
    );
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                });
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            backgroundColor: Colors.black,
            title: Text(translate(context).profile),
            centerTitle: true),
        body: FutureBuilder(
          future: FetchUser(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as Map<String, dynamic>;
              return profilebody(context, data);
            } else {
              return LinearProgressIndicator(
                color: ColorConstant.instance.red,
              );
            }
          }),
        ));
  }

  Padding profilebody(BuildContext context, var data) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(50, 70, 50, 20),
        child: Container(
          child: Center(
            child: Column(children: [
              Text(
                translate(context).editprofile,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              //Resim değiştirirelecek.
              InkWell(
                onTap: (() {
                  setState(() async {
                    await _image.UpdateImageOfuser();
                  });
                }),
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(data['image']),

                      backgroundColor: Colors.transparent,
                      radius: 50,
                      //Text
                    ),
                    Text("+",
                        style: TextStyle(
                            color: ColorConstant.instance.red, fontSize: 30)),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Text(
                translate(context).gamecode,
                style: TextStyle(fontSize: 20),
              ),

              Text(
                data['invitecode'],
                style: TextStyle(fontSize: 20),
              ),
              Text("username " + data['userName'],
                  style: TextStyle(fontSize: 20)),
              Text("Para: " + data['coin'].toString(),
                  style: TextStyle(fontSize: 20)),
              Text("Puan: " + data['point'].toString(),
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 45),
            ]),
          ),
        ));
  }
}
