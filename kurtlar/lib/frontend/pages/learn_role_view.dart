import 'package:flutter/material.dart';

class learnRole extends StatefulWidget {
  //const learnRole({super.key});

  @override
  State<learnRole> createState() => _learnRoleState();
}

class _learnRoleState extends State<learnRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Image.network("sfdsaf"), // Resmi databaseden alacağız.
            SizedBox(
              height: 15,
            ),
            Text("Kullanıcı ismi"),

            Text(
                "Cihazı bu oyuncuya verin hazır olduğunda yukarıda ki profili seçin")
          ],
        ),
      ),
    );
  }
}
