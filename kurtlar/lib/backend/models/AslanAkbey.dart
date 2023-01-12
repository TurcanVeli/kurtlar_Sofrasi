import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/models/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';
import 'package:flutter/material.dart';

class AslanAkbey extends Role {
  static AslanAkbey instance = AslanAkbey.init();
  AslanAkbey.init();
  final String _MissionText =
      "No Secret";
  final String _RoleDefinition =
      "You have taken important positions in your state and now you have raised a very important person and you have the ability to keep secrets";

  String _Name = "Aslan Akbey";
  final String _team = "Derin Devlet";
  final String _imagepath = "assets/images/aslan.png";
  final int countOfVote = 1;
  int count = 0;
  Players _chosenUser = null;

  Players get chosenUser => _chosenUser;

  void SetchosenUser(Players chosenUser) {
    _chosenUser = chosenUser;
  }

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
  // TODO: implement getRemainmissioncount
  int get getRemainmissioncount => throw UnimplementedError();

  @override
  // TODO: implement imagePath
  String get imagePath => _imagepath;
}
