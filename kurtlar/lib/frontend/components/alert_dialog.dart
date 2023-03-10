import 'package:flutter/material.dart';

import '../../backend/lang/language_constant.dart';
import '../base/color_constants.dart';






Widget dialog(BuildContext context, String header, String Body) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    clipBehavior: Clip.antiAlias,    title: Text(header, textAlign: TextAlign.center),

    content: Text(Body),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            translate(context).ok,
            style: TextStyle(color: ColorConstant.instance.red, fontSize: 17),
          ))
    ],
  );
}



void showAlert(BuildContext context, String header, String Body){
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