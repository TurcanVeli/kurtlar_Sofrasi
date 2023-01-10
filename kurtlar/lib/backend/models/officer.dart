import 'package:kurtlar/frontend/models/players.dart';

import 'BaseRole.dart';

class officer extends Role {
  final String _MissionText = "No Mission";
  final String _RoleDefinition = "Sıradan bir istirbahat elemeanısın";
  String _Name = "Memur";
  final String _team = "Derin Devlet";
  final String _imagepath = "";
  final int countOfVote = 1;
  Players _chosenUser = null;

  Players get chosenUser => _chosenUser;

  void SetchosenUser(Players chosenUser) {
    _chosenUser = chosenUser;
  }

  int count = 4;

  @override
  String DoMission() {
    return "Görevin Yok";
  }

  @override
  String get GetMissionText => _MissionText;

  @override
  String get GetName => _Name;

  @override
  String get GetRoleDefiniton => _RoleDefinition;

  @override
  String get GetTeam => _team;
  @override
  int get Getcount => count;

  void SetCount(int value) {
    count = value;
  }

  void increment() {
    if (count != 4) count++;
  }

  void decrase() {
    if (count != 0) {
      count--;
    }
  }

  @override
  // TODO: implement getRemainmissioncount
  int get getRemainmissioncount => 1;

  @override
  // TODO: implement imagePath
  String get imagePath => _imagepath;
}