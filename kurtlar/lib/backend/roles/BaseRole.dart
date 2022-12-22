abstract class Role {
  String get GetName;
  String get GetMissionText;
  String get GetTeam;
  String get GetRoleDefiniton;
  bool get GetinJail;
  bool get GetDead; //Default value is abously False

  set SetName(String name);
  set SetInJail(bool value);
  
  //Oylamayı sıfırlamak için
  set SetVote(int value);

  //Birer defa çalışacak
  void incrementVote();

  void DoMission(Role someone);
}
