import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class Karahanli extends Role {
  final String _MissionText =
      "Birinin rolünü sustur";
  final String _RoleDefinition = "Mafyanın başındaki adamsın";

  String _Name = "Karahanlı";
  final String _team = "Mafya";
  final int countOfVote = 1;
  Players chosenUser;
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
    if(remainingMission >0){
      remainingMission--;
      return "Susturuldu";
    }
    return "Yoruldun";
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
  // TODO: implement ChosenUser
  Players get ChosenUser => chosenUser;
  
  @override
  void setChosenUser(Players user) {
    chosenUser = user;
  }
  
  @override
  // TODO: implement getRemainmissioncount
  int get getRemainmissioncount => throw UnimplementedError();
}
