import 'package:flutter/material.dart';
import '../../backend/roles/BaseRole.dart';

class Players {
  String _Name;
  Image _playerImage;
  Role _role; //Hangi rollde olduğu
  int _vote = 0;
  String _Tempteam = "Yok"; //Laz Ziya kullanırsa mafya olacak
  List<Players> Murders =
      []; //Eğer ölrüse listeye bir mafya girecek bir de derin devlet.

  Players(this._Name);

  //Defaul value = FAlse
  bool _isJail = false;
  bool _isDead = false;

  String get GetName => _Name;
  Image get GetImageOfPLayer => _playerImage;
  Role get GetRole => _role; //rolün ismi dönmez obje döner
  bool get Getisdead => _isDead;
  int get GetVote => _vote; //Sahip Olduğu Oy sayısı
  String get GetTempTeam => _Tempteam;

  void SetVote(int Value) {
    // Value always should be 0. Her oylama sonund ahapise gitmemiş ise oylar sıfırlanacak
    _vote = Value;
  }

  void Setrole(Role role) {
    _role = role;
  }

  void SetTempTeam(String Value) {
    _Tempteam = Value;
  }

  void incrementVote() {
    _vote++;
  }
  void decrementvote(){
    _vote--;
  }
  //void AddMurders() {
  //Lise alacak parametre olarak ve random 2 takımdan birer tane oyuncu seçilecek
  //Oyundan 2 kişi seçilecek.
  //TODO this.Murders.add()
  //}
}
