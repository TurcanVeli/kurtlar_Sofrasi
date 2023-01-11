import 'package:kurtlar/frontend/models/players.dart';

import '../../backend/models/BaseRole.dart';

List<Players> USERS = [];

List CloningUser = [...USERS];

List<Role> addedRoles = [];
List<Players> MafiasUsers = [];
List<Players> GovermentUsers = [];
Players PolatUser = Players("Oyunda Yok", "1", "https://firebasestorage.googleapis.com/v0/b/kurtlarsofrasi-1b36c.appspot.com/o/deafultAvatar.png?alt=media&token=02779a75-228e-412f-b524-befbe8bec3c8", 1, 1,"0");
