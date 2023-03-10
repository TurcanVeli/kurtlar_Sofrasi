import 'package:flutter/material.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kurtlar/backend/service/ImageSevice.dart';
import 'package:kurtlar/backend/service/auth.dart';
import 'package:kurtlar/backend/service/firestoreService.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';

/* In this page, the person who have account in the game  can change the name 
 * and update the photograph of user avatar. Also, players is going to learn 
 * their invite codes in this page */

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with CacheID {
  /* Firestore and ImageService is initialized in here */
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImageService _image = ImageService();
  var newusername = TextEditingController();
  firestoreService _store = firestoreService();

  Future FetchUser() async {
    var userId = await GetID();
    var ref = _firestore.collection("Users").doc(userId);

    var data = ref.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data.toString());
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
        backgroundColor: ColorConstant.instance.black,
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
            backgroundColor: ColorConstant.instance.black,
            title: Text(translate(context).profile),
            centerTitle: true),
        /* We are controlling the data in database if there is a person */
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

  void initState() {
    super.initState();
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
              /* Image is going to upload according to chosen picture */ 
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

                      backgroundColor: ColorConstant.instance.transparent,
                      radius: 50,
                      //Text
                    ),
                    Text("+",
                        style: TextStyle(
                            color: ColorConstant.instance.red,
                            fontSize: 30)),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.all(5),
                width: 200,
                height: 40,
                child: Text(
                  "${translate(context).gamecode} : ${data['invitecode']}",

                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorConstant.instance.white,
                      fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                height: 35,
                child: Text("Username: " + data['userName'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: ColorConstant.instance.white,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                height: 30,
                child: Text("Money: " + data['coin'].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: ColorConstant.instance.white,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                height: 30,
                child: Text("Point: " + data['point'].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: ColorConstant.instance.white,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 30),
              Container(
               width: double.infinity,
                height: 50,
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(0),
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        backgroundColor: ColorConstant.instance.white,
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              Container(
                                  width: 700,
                                  height: 50,
                                  alignment: Alignment.bottomCenter,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextButton.icon(
                                    icon: const Icon(
                                      Icons.change_circle_rounded,
                                      color: Colors.black,
                                      size: 24.0,
                                    ),
                                    label: const Text(
                                      'Change',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () async {
                                      if (newusername.text.length != 0) {
                                        _store.SetUserName(
                                            await GetID(), newusername.text);
                                        setState(() {});
                                      }
                                    },
                                  )),
                              Container(
                                  padding: EdgeInsets.all(8),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: TextField(
                                      controller: newusername,
                                      cursorColor:
                                          Theme.of(context).backgroundColor,
                                      maxLength: 20,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.forward,
                                              color: ColorConstant
                                                  .instance.Venetian_Red),
                                          labelText: 'Username',
                                          labelStyle: TextStyle(
                                              color: ColorConstant
                                                  .instance.Venetian_Red),
                                          helperText: "Change Your Name",
                                          suffixIcon: Icon(Icons.check_box,
                                              color: ColorConstant
                                                  .instance.Venetian_Red),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ColorConstant
                                                  .instance.Venetian_Red,
                                            ),
                                          )),
                                    ),
                                  ))
                            ],
                          );
                        });
                  },
                  child: Text(
                    "Change Username",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorConstant.instance.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
