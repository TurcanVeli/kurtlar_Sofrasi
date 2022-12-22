import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/pages/registerview.dart';

// NAVIGATION SU ANLIK REGISTER SAYFASINI GOSTERIYOR DEGISTIRILECEK

class DescribeOfRoles extends StatelessWidget {
  DescribeOfRoles(
      {super.key,
      required this.header,
      required this.explanation});
  String header;
  String explanation;
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
