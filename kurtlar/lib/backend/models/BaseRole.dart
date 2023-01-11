import 'package:kurtlar/frontend/models/players.dart';

/* These are the properties of roles. Other model files is going to inherit this class. */ 
abstract class Role {
  String get imagePath;

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
  void SetchosenUser(Players chosenUser);


}
