import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Abdulhey extends Role {
  final String _MissionText = "Abdulleysin";
  final String _RoleDefinition = "Derin devletin tetikçisisin";

  String _Name = "Abdulhey";
  final String _team = "Derin Devlet";
  final int countOfVote = 1;
  int count = 0;
  int remainingMission = 1;

  @override
  String get GetMissionText => _MissionText;

  @override
  String get GetName => _Name;

  @override
  String get GetRoleDefiniton => _RoleDefinition;

  @override
  String get GetTeam => _team;

  //Polat bastığı kişinin hangi takımda olduğunu görecek
  //Pop-Up çıkacak.

  @override
  bool DoMission(Players player) {
    return true;
  }

  @override
  // TODO: implement Getcount
  int get Getcount => count;
  void increment() {
    if (count == 0) {
      count++;
    }
  }

  void decrase() {
    if (count == 1) {
      count--;
    }
  }
}
