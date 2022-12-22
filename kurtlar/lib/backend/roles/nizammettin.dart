import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class nizamettin extends Role {
  final String _MissionText = "Birinin rolünü açığa çıkart";
  final String _RoleDefinition = "Sen Mafyanın avukatısın";
  String _Name = "Nizamettin";
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
  String get GetMissionText => _MissionText;

  @override
  String get GetName => _Name;

  @override
  String get GetRoleDefiniton => _RoleDefinition;

  @override
  String get GetTeam => _team;

  @override
  int get Getcount => count;

  void increment(){
    if (count == 0){
      count++;
    }
  }
  void decrase(){
    if (count == 1){
      count--;
    }
  }
}
