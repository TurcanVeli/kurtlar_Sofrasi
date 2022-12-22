import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class LazZiya extends Role {
  final String _MissionText = "Birinin rolünü açığa çıkart";
  final String _RoleDefinition = "Sen Mafyanın laz ziyasısın";
  String _Name = "Laz Ziya";
  final String _team = "Mafya";
  int remainingMission = 1;
  final int countOfVote  = 1;
  bool muted = false;

  //ToDo Laz Zİyamızın görevi
 

  @override
  String get GetMissionText => _MissionText;

  @override
  String get GetName => _Name;

  @override
  String get GetRoleDefiniton => _RoleDefinition;

  @override
  String get GetTeam => _team;
  

  //Tüm oyun boyunca sürecek ve sadece bir defa kullanılabilcek
  @override
  bool DoMission(Players player) {
    if (remainingMission != 0){
      player.SetTempTeam("Mafya");
      return true;
    }
    return false;
    
  }


  

}
