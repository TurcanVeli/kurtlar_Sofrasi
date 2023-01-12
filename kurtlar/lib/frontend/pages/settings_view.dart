// settings
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/service/auth.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import '../../main.dart';
import 'login_view.dart';

/* This page will be drawn after the setting button was pressed */
class SettingPageUI extends StatefulWidget {
  const SettingPageUI({Key key}) : super(key: key);
  @override
  State<SettingPageUI> createState() => _SettingPageUIState();
}

class _SettingPageUIState extends State<SettingPageUI>{
  Locale defaultLocale;
  AuthService _auth = AuthService();
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(translate(context).settings,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.language,
                  size: 30.0,
                  color: Color.fromARGB(255, 189, 13, 42),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(2, 10, 10, 10),
                    child: buildAccountOption(
                        context, translate(context).changeLanguage,),),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.output,
                  size: 30.0,
                  color: Color.fromARGB(255, 189, 13, 42),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: TextButton(  child: Text(translate(context).signout) ,style: TextButton.styleFrom( primary: Colors.black
                    ,textStyle:  TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ), onPressed: (() {
                    _auth.signOut();
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                  }),

                  ),
                )],
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

  /* This code shows us alert dialog to choose language */
  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        getLocale().then((locale) => defaultLocale = locale);
        showDialog(
            context: context,
            builder: (BuildContext context) {

              return AlertDialog(
                title: Text(title,textAlign: TextAlign.center,),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /* This button is going to make  the language from english to turkish */
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          
                          Locale _locale = await setLocale("tr");
                          MyApp.setLocale(context, _locale);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            decoration: LanguageContainerDecaration("tr_TUR"),
                            
                            width: double.infinity,
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(translate(context).tr),
                                SizedBox(
                                  width: 5,
                                ),
                                Flag.fromCode(
                                  FlagsCode.TR,
                                  height: 15,
                                  width: 15,
                                )
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    /* This button is going to make the language from turkish to english */
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          Locale _locale = await setLocale("en");
                          MyApp.setLocale(context, _locale);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            decoration: LanguageContainerDecaration("en_US"),
                            width: double.infinity,
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(translate(context).eng),
                                SizedBox(
                                  width: 5,
                                ),
                                Flag.fromCode(
                                  FlagsCode.TR,
                                  height: 15,
                                  width: 15,
                                )
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          Locale _locale = await setLocale("es");
                          MyApp.setLocale(context, _locale);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            decoration: LanguageContainerDecaration("es_ES"),
                            width: double.infinity,
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(translate(context).es),
                                SizedBox(
                                  width: 5,
                                ),
                                Flag.fromCode(
                                  FlagsCode.ES,
                                  height: 15,
                                  width: 15,
                                )
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          Locale _locale = await setLocale("de");
                          MyApp.setLocale(context, _locale);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            decoration: LanguageContainerDecaration("de_DE"),
                            width: double.infinity,
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(translate(context).de),
                                SizedBox(
                                  width: 5,
                                ),
                                Flag.fromCode(
                                  FlagsCode.DE,
                                  height: 15,
                                  width: 15,
                                )
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          Locale _locale = await setLocale("it");
                          MyApp.setLocale(context, _locale);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            decoration: LanguageContainerDecaration("it_IT"),
                            width: double.infinity,
                            height: 20,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(translate(context).it),
                                SizedBox(
                                  width: 5,
                                ),
                                Flag.fromCode(
                                  FlagsCode.IT,
                                  height: 15,
                                  width: 15,
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(translate(context).ok))
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

  BoxDecoration LanguageContainerDecaration(String LanguageCode) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: defaultLocale.toString() == LanguageCode
          ? ColorConstant.instance.red
          : ColorConstant.instance.white,
      boxShadow: [
        BoxShadow(
          color:

          Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
      ],
    );
  }
}
