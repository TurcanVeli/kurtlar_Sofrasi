import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class nizamettin extends Role {
  final String _MissionText = "Sabahki duruşmada birini koru";
  final String _RoleDefinition = "Sen Mafyanın avukatısın";
  String _Name = "Nizamettin";
  final String _team = "Mafya";
  int remainingMission = 1;
  final int countOfVote = 1;
  Players _chosenUser = null;

  Players get chosenUser => _chosenUser;

  set SetchosenUser(Players chosenUser) {
    _chosenUser = chosenUser;
  }

  int count = 0;

//Değişecek
  @override
  String DoMission() {
    if (remainingMission == 1 || chosenUser != null) {
      remainingMission--;
      //Kurtar
      chosenUser.setSaving(true);
      return "Kurtarıldı";
    }
    return "Bugünlük iş yok";
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
}
