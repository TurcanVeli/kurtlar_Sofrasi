import 'package:kurtlar/backend/roles/BaseRole.dart';
import 'package:kurtlar/frontend/models/players.dart';

class Polat extends Role {
  static Polat instance = Polat._init();
  Polat._init();

  final String _MissionText = "Birinin rolünü açığa çıkart";
  final String _RoleDefinition =
      "Sen polat alemdarsın ve derin devlete bağlısına zamanı geldiğinde mafyaların kim olduğunu bulmak için yeteneklerini kullanacaksın ve devletine yarıdm edeceksin yakalanmamaya dikkat et";

  String _Name = "Polat";
  final String _team = "Derin Devlet";
  final int countOfVote = 1;

  int count = 0;
  Players chosenUser;

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
    if (chosenUser.GetTempTeam != "None"){
        return chosenUser.GetTempTeam;
     }else{
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
  void decrase(){
    if (count == 1){
      count--;
    }
  }
  
  @override
  // TODO: implement ChosenUser
  Players get ChosenUser => chosenUser;//Oficerda kullanılırsa hata döner
  
  @override
  void setChosenUser(Players user) {
    chosenUser = user;
  }
  
  @override
  // TODO: implement getRemainmissioncount
  int get getRemainmissioncount => throw UnimplementedError();
}
