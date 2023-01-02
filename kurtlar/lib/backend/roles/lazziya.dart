import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class LazZiya extends Role {
  final String _MissionText = "Birini Suçla";
  final String _RoleDefinition = "Sen Mafyanın laz ziyasısın";
  String _Name = "Laz Ziya";
  final String _team = "Mafya";
  int remainingMission = 1;
  final int countOfVote = 1;
  int count = 0;
  Players chosenUser;

  //ToDo Laz Zİyamızın görevi

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
    if(remainingMission == 1){
      remainingMission--;
      chosenUser.SetTempTeam("Mafya");
      return "İftira atıldı";
    }
    return "Yoruldun be ziya";
  }
  @override
  int get Getcount => count;
  
  void increment(){
    if (count == 0){
      count++;
    }
  }
  void decrase(){
    if (count == 1){
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
