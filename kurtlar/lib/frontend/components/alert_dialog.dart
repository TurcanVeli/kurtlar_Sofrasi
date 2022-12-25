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
