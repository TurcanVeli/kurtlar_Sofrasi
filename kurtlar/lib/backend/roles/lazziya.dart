import 'package:kurtlar/backend/roles/BaseRole.dart';

class LazZiya extends Role {
  final String _MissionText = "Birinin rolünü açığa çıkart";
  final String _RoleDefinition = "Sen Mafyanın laz ziyasısın";

  String _Name = "Laz Ziya";
  final String _team = "Mafya";
  bool _injail = false;
  bool _idead = false;
  int _vote = 0;

  //ToDo Laz Zİyamızın görevi
  @override
  void DoMission(Role someone) {
    if (someone.GetDead == true) {
      print("YEs");
    }
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
  set SetName(String name) {
    this._Name = name;
  }

  @override
  set SetInJail(bool value) {
    this._injail = value;
  }

  @override
  bool get GetDead => _idead;

  @override
  bool get GetinJail => _injail;

  @override
  set SetVote(int value) {
    this._vote = value;
  }

  @override
  void incrementVote() {
    this._vote++;
  }
}
