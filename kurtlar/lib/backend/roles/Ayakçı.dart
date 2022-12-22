import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class Ayakci extends Role {
  final String _MissionText =
      "Hiçbir özelliğin yok,kendini derin devlete belli etme";
  final String _RoleDefinition = "Sen Mafyanın amelesisin";
  String _Name = "Ayakçı";
  final String _team = "Mafya";
  int remainingMission = 1;
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
