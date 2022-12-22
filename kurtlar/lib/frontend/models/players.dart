import 'package:flutter/material.dart';
import '../../backend/roles/BaseRole.dart';

class Players {
  late String _Name;
  late Image _playerImage;
  late Role _role;
  late int _vote;
  late String _team = "yok";
  late String _Tempteam = "Yok"; //Laz Ziya kullanırsa mafya olacak
  late List<Players> Murders =
      []; //Eğer ölrüse listeye bir mafya girecek bir de derin devlet.

  Players(this._Name, this._playerImage);

  //Defaul value = FAlse
  bool _isJail = false;
  bool _isDead = false;

  String get GetName => _Name;
  Image get GetImageOfPLayer => _playerImage;
  Role get GetRole => _role; //rolün ismi dönmez obje döner
  bool get Getisdead => _isDead;
  int get GetVote => _vote;
  String get GetTeam => _team;
  String get GetTempTeam => _Tempteam;

  void SetVote(int Value) {
    // Value always should be 0. Her oylama sonund ahapise gitmemiş ise oylar sıfırlanacak
    _vote = Value;
  }

  void SetTeam(String teamName) {
    _team = teamName;
  }

  void SetTempTeam(String Value) {
    _Tempteam = Value;
  }

  void incrementVote() {
    _vote++;
  }

  //void AddMurders() {
  //Lise alacak parametre olarak ve random 2 takımdan birer tane oyuncu seçilecek
  //Oyundan 2 kişi seçilecek.
  //TODO this.Murders.add()
  //}
}
