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
  Players chosenUser;

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
  String DoMission() {
    if(remainingMission ==1){
      remainingMission--;
      ChosenUser.setHitBullet();
      return "Vuruldu";
    }
    return "Memrmin bitti";
  }

  @override
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
  
  @override
  // TODO: implement ChosenUser
  Players get ChosenUser => chosenUser;
  
  @override
  void setChosenUser(Players user) {
    chosenUser = user;
  }
  
  @override
  // TODO: implement getRemainmissioncount
  int get getRemainmissioncount => throw UnimplementedError();
}
