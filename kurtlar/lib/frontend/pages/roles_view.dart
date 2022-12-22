import 'package:flutter/material.dart';
import '../constant/constant.dart';

class rolesPage extends StatefulWidget {
  const rolesPage({super.key});

  @override
  State<rolesPage> createState() => _rolesPageState();
}

class _rolesPageState extends State<rolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Karakter Seçme"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    child: Center(
                      child: Text("DERİN DEVLET"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/bullet2.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              GridView.count(crossAxisCount: 3, children: goverment.map((e) => {
                return Text("data");
              }).toList()),
              Container(
                child: Center(
                  child: Text("MAFYA"),
                ),
              ),
              GridView.count(crossAxisCount: 3)
            ],
          ),
        ));
  }
}
