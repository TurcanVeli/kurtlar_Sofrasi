import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kurtlar/backend/models/users.dart';

class FireBaseService {
  static const String FIREBASEURL =
      "https://kurtlar-122d7-default-rtdb.firebaseio.com/";

  Future<List<users>> getUsers() async {
    final response = await http.get(Uri(host: "$FIREBASEURL/users.json"));

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body);
        final userList = jsonModel.map((e){users.fromJson(e as Map<String,dynamic>);}).toList();
        return userList.cast<users>();

      default:
        return Future.error(response.statusCode);
    }
  }
}
