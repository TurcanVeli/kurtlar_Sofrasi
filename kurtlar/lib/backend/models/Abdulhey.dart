import 'package:kurtlar/backend/models/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class Abdulhey extends Role {
   static Abdulhey instance = Abdulhey._init();
   Abdulhey._init();
  final String _MissionText = "CHOOSE THE PERSON YOU WANT TO USE THE BULLET";
  final String _RoleDefinition = "You are the hitman of the state and you have only one bullet..";

  String _Name = "Abdulhey";
  final String _team = "Derin Devlet";
  final String _imagepath = "assets/images/abdulhey.png";
  final int countOfVote = 1;
  int count = 0;
  int remainingMission = 1;
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

  @override
  String DoMission() {
    if (remainingMission == 1 && this.chosenUser != null) {
      remainingMission--;
      chosenUser.setHitBullet();
      return "Vuruldu";
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
  int get getRemainmissioncount => remainingMission;

  @override
  String get imagePath => _imagepath;
}
