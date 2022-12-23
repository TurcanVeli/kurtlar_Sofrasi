import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class Cakir extends Role {
  final String _MissionText = "Oylamada attığın oy 2 sayılır";
  final String _RoleDefinition = "Mafyanın asabi ergenisin";

  String _Name = "Çakır";
  final String _team = "Mafya";
  final int countOfVote = 2;
  bool muted = false;
  int count = 0;
  int remainingMission = 1;

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
  bool DoMission(Players player) {
    if (player.GetTempTeam == "Mafya") {
      print(player.GetTempTeam);
    } else {
      print(player.GetTeam); //Bu fonsiyon String return edecek

    }
    return true;
  }

  @override
  int get Getcount => count;
   void increment() {
    if (count == 0) {
      count++;
    }
  }
  void decrase(){
    if (count == 1){
      count--;
    }
  }
}
