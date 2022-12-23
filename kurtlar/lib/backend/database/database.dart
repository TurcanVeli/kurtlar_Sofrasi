import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kurtlar/backend/models/users.dart';

class FireBaseService {
  static const String FIREBASEURL =
      "https://kurtlar-122d7-default-rtdb.firebaseio.com/";

  Future<List<users>> getUsers() async {
    final response = await http.get(Uri(host: FIREBASEURL));

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body);
        final userList = jsonModel as List<users>;
        return userList;

      default:
        return Future.error(response.statusCode);
    }
  }
}
