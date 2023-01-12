// basliyor sayfasi
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/pages/create_view.dart';

import '../base/color_constants.dart';
import '../components/button.dart';

/* This is the page before enter the game */ 
class starting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.instance.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorConstant.instance.black,
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
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/images/mermi.png',
                  )),
              Container(
                width: 1000,
                height: 40,
                alignment: Alignment.centerLeft,
                child: Center(
                  child: Text(
                    translate(context).strating,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                  width: 300,
                  height: 300,
                  child: Text(translate(context).story),
                ),
              ),
              Container(
                width: 100,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => create()));
                  },
                  child: Text(translate(context).contiune),
                  style: TextButton.styleFrom(
                    backgroundColor: ColorConstant.instance.red,
                    primary: ColorConstant.instance.black,
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
