import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class DoguBey extends Role {
  final String _MissionText = "İstihbarat Sağla";
  final String _RoleDefinition =
      "Doğu bey sezgileri güçlü olan bir derin devlet üyesidir";

  String _Name = "Doğu Bey";
  final String _team = "Derin Devlet";
  final String _imagepath = "";
  final int countOfVote = 1;
  int count = 0;
  int remainingMission = 1;
  Players _chosenUser= null;

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
    if(remainingMission ==1|| chosenUser != null){
      remainingMission--;
      //TODO
      return "istihbarat sağlandı";
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
  int get getRemainmissioncount => remainingMission;
  
  @override
  // TODO: implement imagePath
  String get imagePath => _imagepath;
  

}
