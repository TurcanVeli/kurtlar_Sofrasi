import 'package:kurtlar/frontend/models/players.dart';

//Tüm DoMissionlar değişecek.
abstract class Role {
  String get GetName;
  String get GetMissionText;
  String get GetTeam;
  String get GetRoleDefiniton;
  int get Getcount;
  bool DoMission(Players player);
  void increment();
  void decrase();
}
