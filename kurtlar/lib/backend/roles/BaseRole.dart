import 'package:kurtlar/frontend/models/players.dart';




//Tüm DoMissionlar değişecek.
abstract class Role {
  String get GetName;
  String get GetMissionText;
  String get GetTeam;
  String get GetRoleDefiniton;
  int get Getcount;
  Players get ChosenUser;
  int get getRemainmissioncount;
  void setChosenUser(Players user);
  
  String DoMission();

  void increment();
  void decrase();
}

