import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class nizamettin extends Role {
  final String _MissionText = "Birinin rolünü açığa çıkart";
  final String _RoleDefinition = "Sen Mafyanın laz ziyasısın";
  String _Name = "Nizamettin";
  final String _team = "Mafya";
  int remainingMission = 2;
  final int countOfVote = 1;
  bool muted = false;
  int count = 0;

//Değişecek
  @override
  bool DoMission(Players player) {
    if (player.Getisdead == true) {
      print("Do Something");
      return true;
    }
    return false;
  }

  @override
  // TODO: implement GetMissionText
  String get GetMissionText => _MissionText;

  @override
  String get GetName => _Name;

  @override
  String get GetRoleDefiniton => _RoleDefinition;

  @override
  String get GetTeam => _team;

  @override
  // TODO: implement Getcount
  int get Getcount => count;
}
