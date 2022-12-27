// create sayfasi
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/models/users.dart';
import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/constant/constant.dart';
import 'package:kurtlar/frontend/models/players.dart';
import 'package:kurtlar/frontend/pages/lookyourRole_view.dart';

class create extends StatefulWidget {
  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
  List<Players> Users = [Players("Veli"),Players("Ahmet"),Players("Emre")];
  //List<Role> roles = [polat];
  @override 
  void initState() {
  
    for (int i= 0; i< Users.length; i++){
      //var randomItem = (roles..shuffle()).first;
      //roles.removeAt(0);
      //Users[i].Setrole(randomItem);
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(70),
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'images/wolf_logo.png',
                  )),
              Container(
                width: 1000,
                height: 40,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kur",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Text("       "
                      "Bütün oyuncular bir birine bakacak şekilde büyük bir çember halinde oturmalıdır. Cihaz oyuncular arasında paslanacak."
                      "Her oyuncu derin devlete veya mafyaya ait bir rol alacak. bu rolü kimseye söyleme."
                      "Her oyuncu rol aldıktan sonra ilk gece başlayacak."),
                ),
              ),
              Container(
                width: 100,
                height: 40,
                child: TextButton(
                  onPressed: () {
                     Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => YourRole(Users)));
                  },
                  child: Text("HAZIR"),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    primary: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
