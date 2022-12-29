import 'package:flutter/material.dart';

import '../../backend/lang/language_constant.dart';


// NAVIGATION SU ANLIK REGISTER SAYFASINI GOSTERIYOR DEGISTIRILECEK




Widget _dialog(BuildContext context, String header, String Body) {
  return AlertDialog(
    title: Text(header),
    content: Text(Body),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            translate(context).ok,
            style: TextStyle(color: Colors.red, fontSize: 17),
          ))
    ],
  );
}

Future<bool> OnWillPop(BuildContext context, Widget where) async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Oyunu bitirmek istiyor musun'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => {
               Navigator.pop(context,true),
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => where),)
            },
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

