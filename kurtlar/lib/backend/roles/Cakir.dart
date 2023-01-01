import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class Cakir extends Role {
  final String _MissionText = "Oylamada attığın oy 2 sayılır";
  final String _RoleDefinition = "Mafyanın asabi ergenisin";

  String _Name = "Çakır";
  final String _team = "Mafya";
  final int countOfVote = 2;
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

 
    @override
    String DoMission() {
      return "büyüksün abi";
    }
  //Pop-Up çıkacak.
  

  @override
  int get Getcount => count;
   void increment() {
    if (count == 0) {
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
  Players get ChosenUser => throw UnimplementedError();
  
  @override
  void setChosenUser(Players user) {
   print("Nothing");
  }
  
  @override
  // TODO: implement getRemainmissioncount
  int get getRemainmissioncount => throw UnimplementedError();
  
}
