import 'package:flutter/material.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:kurtlar/frontend/models/usersAndroles.dart';
import 'package:kurtlar/frontend/pages/login_view.dart';
import 'package:kurtlar/frontend/pages/players_view.dart';
import 'package:kurtlar/frontend/pages/profile_view.dart';
import 'package:kurtlar/frontend/pages/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../base/color_constants.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with CacheID {
  @override
  void initState() {
    USERS = [];
    GovermentUsers = [];
    MafiasUsers = [];
    for (int i = 0; i < addedRoles.length; i++) {
      addedRoles[i].decrase();
    }

    super.initState();
  }

  // Oyun kurallarını gosteren buton
  void ShowAlertDialog(BuildContext context) {
    Widget okBtn = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          translate(context).ok,
          style: TextStyle(color: ColorConstant.instance.red),
        ));

    AlertDialog alert = AlertDialog(
      title: Text("Kurtlar Sofrası"),
      content: Column(
        children: [
          Text(translate(context).rule_1),
          Text(translate(context).rule_2),
          Text(translate(context).rule_3),
          Text(translate(context).rule_4),
          Text(translate(context).rule_5)
        ],
      ),
      actions: <Widget>[okBtn],
    );

    showDialog(
        context: context,
        builder: (BuildContext buildercontext) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: ColorConstant.instance.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingPageUI()));
            },
          )
        ],
        backgroundColor: ColorConstant.instance.black,
      ),
      backgroundColor: ColorConstant.instance.black,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/images/bullet.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 300,
              height: 100,
              alignment: Alignment.bottomCenter,
              child: Text(
                "KURTLAR SOFRASI",
                style: TextStyle(
                    color: ColorConstant.instance.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
            Container(
              width: 125,
              height: 50,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Kurtlukta Düşeni Yemek Kanundur",
                style: TextStyle(
                  color: ColorConstant.instance.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Button(
                buttonText: translate(context).newgame,
                Height: 50,
                where: PlayerPage(),
                Width: 200),
            const SizedBox(
              height: 25,
            ),
            Button(
                buttonText: translate(context).profile,
                Height: 50,
                where: profile(),
                Width: 200),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 50,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorConstant.instance.Venetian_Red,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(0),
              child: TextButton(
                onPressed: () {
                  ShowAlertDialog(context);
                },
                child: Text(
                  translate(context).howtoplay,
                  style: TextStyle(
                      color: ColorConstant.instance.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
