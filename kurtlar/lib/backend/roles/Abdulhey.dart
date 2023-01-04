import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class Abdulhey extends Role {
  final String _MissionText = "You have just one shot";
  final String _RoleDefinition = "Derin devletin tetikçisisin";

  String _Name = "Abdulhey";
  final String _team = "Derin Devlet";
  final int countOfVote = 1;
  int count = 0;
  int remainingMission = 1;
  Players _chosenUser = null;

  Players get chosenUser => _chosenUser;

  set SetchosenUser(Players chosenUser) {
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
    if (remainingMission == 1 || _chosenUser != null) {
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
  // TODO: implement getRemainmissioncount
  int get getRemainmissioncount => remainingMission;
}
