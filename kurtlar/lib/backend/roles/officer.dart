import 'package:kurtlar/frontend/models/players.dart';

import 'BaseRole.dart';

class officer extends Role {
  final String _MissionText = "Görevin Yok";
  final String _RoleDefinition = "Sıradan bir istirbahat elemeanısın";
  String _Name = "Memur";
  final String _team = "Derin Devlet";
  final int countOfVote = 1;

  int count = 4;

  @override
  bool DoMission(Players player) {
    // TODO: implement DoMission
    throw UnimplementedError();
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
  int get Getcount => count;

  void SetCount(int value) {
    count = value;
  }

  void increment() {
    if (count != 4) count++;
  }

  void decrase() {
    if (count != 0) {
      count--;
    }
  }
}
