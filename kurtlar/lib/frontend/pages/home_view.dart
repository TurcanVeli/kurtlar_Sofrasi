import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/pages/players_view.dart';
import 'package:kurtlar/frontend/pages/profile_view.dart';
import 'package:kurtlar/frontend/pages/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatelessWidget {
  void ShowAlertDialog(BuildContext context) {
    Widget okBtn = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(translate(context).ok));

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
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingPageUI()));
            },
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
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
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 125,
              height: 50,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Kurtlukta Düşeni Yemek Kanundur",
                style: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 200,
              height: 50,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PlayerPage()));
                },
                child: Text(
                  translate(context).newgame,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 200,
              height: 50,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => profile()));
                },
                child: Text(
                  AppLocalizations.of(context).profile,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 200,
              height: 50,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
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
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
