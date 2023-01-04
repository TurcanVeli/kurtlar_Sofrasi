import 'package:kurtlar/backend/models/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class Karahanli extends Role {
  final String _MissionText = "Birinin rolünü sustur";
  final String _RoleDefinition = "Mafyanın başındaki adamsın";

  String _Name = "Karahanlı";
  final String _team = "Mafya";
  final String _imagepath = "";
  final int countOfVote = 1;
  Players _chosenUser = null;

  Players get chosenUser => _chosenUser;

  void SetchosenUser(Players chosenUser) {
    _chosenUser = chosenUser;
  }

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
  String DoMission() {
    if (remainingMission > 0 || chosenUser != null) {
      remainingMission--;
      return "Susturuldu";
    }
    return "Bugünlük iş yok";
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
  // TODO: implement getRemainmissioncount
  int get getRemainmissioncount => throw UnimplementedError();

  @override
  // TODO: implement imagePath
  String get imagePath => _imagepath;
}
