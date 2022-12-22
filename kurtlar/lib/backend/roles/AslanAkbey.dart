import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class AslanAkbey extends Role {
  final String _MissionText = "Polat Alemdarı gör";
  final String _RoleDefinition =
      "Derin devletin başındaki adamlardan birisisin";

  String _Name = "Aslan Akbey";
  final String _team = "Derin Devlet";
  final int countOfVote = 1;
  bool muted = false;
  int count = 0;

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
  // TODO: implement Getcount
  int get Getcount => count;
}