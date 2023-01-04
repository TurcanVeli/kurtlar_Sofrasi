import 'package:kurtlar/backend/models/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class LazZiya extends Role {
  final String _MissionText = "Birini Suçla";
  final String _RoleDefinition = "Sen Mafyanın laz ziyasısın";
  String _Name = "Laz Ziya";
  final String _team = "Mafya";
  final String _imagepath = "";
  int remainingMission = 1;
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

  //Tüm oyun boyunca sürecek ve sadece bir defa kullanılabilcek
  @override
  String DoMission() {
    if (remainingMission == 1 && chosenUser != null) {
      remainingMission--;
      chosenUser.SetTempTeam("Mafya");
      return "İftira atıldı";
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
