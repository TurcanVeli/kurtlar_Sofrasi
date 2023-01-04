import 'package:kurtlar/frontend/models/players.dart';

//Tüm DoMissionlar değişecek.
abstract class Role {
  String get GetName;
  String get GetMissionText;
  String get GetTeam;
  String get GetRoleDefiniton;
  int get Getcount;
  Players get chosenUser;
  int get getRemainmissioncount;
  void increment();
  void decrase();
  String DoMission();
  set SetchosenUser(Players chosenUser);


}
