import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/pages/registerview.dart';

// NAVIGATION SU ANLIK REGISTER SAYFASINI GOSTERIYOR DEGISTIRILECEK

class alertDialog extends StatelessWidget {
  alertDialog(
      {super.key,
      required this.header,
      required this.explanation,
      required this.where});
  String header;
  String explanation;
  Widget where;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(header),
      content: Text(explanation),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'TAMAM',
              style: TextStyle(color: Colors.redAccent),
            ))
      ],
    );
  }
}
