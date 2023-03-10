import 'package:kurtlar/backend/models/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class Polat extends Role {
  static Polat instance = Polat._init();
  Polat._init();

  final String _MissionText = "CHOOSE TO SHOW ROLE OF PLAYER";
  final String _RoleDefinition =
      "You're a government-trained man and you have the ability to Lookout";

  String _Name = "Polat";
  final String _team = "Derin Devlet";
  final String _imagepath = "assets/images/polat.png";
  final int countOfVote = 1;

  int count = 0;
  Players _chosenUser = null;

  Players get chosenUser => _chosenUser;

  void SetchosenUser(Players chosenUser) {
    _chosenUser = chosenUser;
  }

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
  String DoMission() {
    if (chosenUser == null) return "Bugünlük iş yok";
    if (chosenUser.GetTempTeam != "None") {
      return chosenUser.GetTempTeam;
    } else {
      return chosenUser.GetRole.GetTeam;
    }
  }

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
  int get getRemainmissioncount => 1;

  @override
  String get imagePath => _imagepath;
}
