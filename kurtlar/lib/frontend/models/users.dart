import 'package:kurtlar/frontend/models/players.dart';

import '../../backend/models/BaseRole.dart';


/* This is the list keeps the information which people entered the game. 
 * We are keeping this information because, roles cannot bigger than count of player */  
List<Players> USERS = [Players("Veli"),Players("Ahmet"),Players("Emre"),Players("PaleWaves"),Players("Son Girişken"),Players("Ali")];

List CloningUser = [...USERS];


List<Role> addedRoles = [];
List<Players> MafiasUser = [];
List<Players> GovermentUser = [];
Players PolatUser = Players("Oyunda Yok");
