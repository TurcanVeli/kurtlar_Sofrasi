import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class Polat extends Role {
  final String _MissionText = "Birinin rolünü açığa çıkart";
  final String _RoleDefinition =
      "Sen polat alemdarsın ve derin devlete bağlısına zamanı geldiğinde mafyaların kim olduğunu bulmak için yeteneklerini kullanacaksın ve devletine yarıdm edeceksin yakalanmamaya dikkat et";

  String _Name = "Polat";
  final String _team = "Derin Devlet";

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
    if (player.GetTempTeam == "Mafia") {
      print(player.GetTempTeam);
    } else {
      print(player.GetTeam); //Bu fonsiyon String return edecek

    }
    return true;

  }
}
