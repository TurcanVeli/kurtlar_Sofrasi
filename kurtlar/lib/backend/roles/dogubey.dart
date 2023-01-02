import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class DoguBey extends Role {
  final String _MissionText = "İstihbarat Sağla";
  final String _RoleDefinition =
      "Doğu bey sezgileri güçlü olan bir derin devlet üyesidir";

  String _Name = "Doğu Bey";
  final String _team = "Derin Devlet";
  final int countOfVote = 1;
  int count = 0;
  int remainingMission = 1;
  Players chosenUser;

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
    if(remainingMission ==1){
      remainingMission--;

      //TODO
      return "istihbarat sağlandı";

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
  int get getRemainmissioncount => remainingMission;
  @override
  // TODO: implement ChosenUser
  Players get ChosenUser => chosenUser;
  
  @override
  void setChosenUser(Players user) {
    if(remainingMission == 1){
      chosenUser = user;
    }
  }
}
