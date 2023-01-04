import 'package:kurtlar/frontend/models/players.dart';

import 'BaseRole.dart';

class mafiamen extends Role {
  final String _MissionText = "görevin yok";
  final String _RoleDefinition = "Basit bir mafya adamısın";
  String _Name = "Mafya Adamı";
  final String _team = "Mafya";
  final String _imagepath = "";
  final int countOfVote = 1;
  Players _chosenUser = null;

  Players get chosenUser => _chosenUser;

  void SetchosenUser(Players chosenUser) {
    _chosenUser = chosenUser;
  }

  int count = 0;

  @override
  String DoMission() {
    return "Görevin yok";
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
  int get getRemainmissioncount => throw UnimplementedError();

  @override
  // TODO: implement imagePath
  String get imagePath => _imagepath;
}
