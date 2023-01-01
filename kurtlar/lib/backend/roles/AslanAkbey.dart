import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';
import 'package:flutter/material.dart';

class AslanAkbey extends Role {
  final String _MissionText =
      "You have taken important positions in your state and now you have raised a very important person and you have the ability to keep secrets";
  final String _RoleDefinition =
      "Derin devletin başındaki adamlardan birisisin";

  String _Name = "Aslan Akbey";
  final String _team = "Derin Devlet";
  final int countOfVote = 1;
  int count = 0;
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
   @override
  String DoMission() {
    return "";
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
  
  @override
  // TODO: implement ChosenUser
  Players get ChosenUser => chosenUser;
  
  @override
  void setChosenUser(Players user) {
    chosenUser = user;//Gelen user always be Polat
  }
  
  @override
  // TODO: implement getRemainmissioncount
  int get getRemainmissioncount => throw UnimplementedError();
}
