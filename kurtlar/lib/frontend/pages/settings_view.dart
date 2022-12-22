// settings
import 'package:flutter/material.dart';

import '../../main.dart';

class SettingPageUI extends StatefulWidget {
  const SettingPageUI({Key? key}) : super(key: key);
  @override
  State<SettingPageUI> createState() => _SettingPageUIState();
}

class _SettingPageUIState extends State<SettingPageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AYARLAR",
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                SizedBox(width: 20),
              ],
            ),
            Divider(height: 12, thickness: 1),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.language,
                  size: 30.0,
                  color: Colors.red,
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(30, 10, 10, 10),
                    child: buildAccountOption(context, "DİLİ DEĞİŞTİR")),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.rate_review_outlined,
                  size: 30.0,
                  color: Colors.red,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(52, 10, 10, 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                    child: Text(
                      'PUANLA',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Text(
                    'TextButton',
                  ));
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        MyApp.of(context)
                            ?.setLocale(Locale.fromSubtags(languageCode: 'tr'));
                        Navigator.of(context).pop();
                      },
                      child: Text('TÜRKÇE'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.black, width: 2),
                          padding: EdgeInsets.all(10.0),
                          minimumSize: Size(90, 50)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        MyApp.of(context)
                            ?.setLocale(Locale.fromSubtags(languageCode: 'en'));
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'İNGİLİZCE',
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.black, width: 2),
                          padding: EdgeInsets.fromLTRB(11, 13, 11, 13),
                          minimumSize: Size(50, 50)),
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            Icon(Icons.arrow_forward_ios, color: Colors.black)
          ],
        ),
      ),
    );
  }
}
