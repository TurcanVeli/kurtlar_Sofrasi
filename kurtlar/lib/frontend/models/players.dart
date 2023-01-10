import 'package:flutter/material.dart';
import '../../backend/models/BaseRole.dart';

class Players {
  String _Name;
  
  Image _playerImage;
  Role _role; //Hangi rollde olduğu
  int _vote = 0;
  String _Tempteam = "None";
  Players(this._Name);
  bool muted = false;
  bool isSaving = false;
//Defaul value = FAlse
  bool _isJail = false;
  bool _isDead = false;
  bool _hitWithBullet = false;
  bool _didyougetInfos = false; //Dogu görevi için

  bool get GetDidYougetInfos => _didyougetInfos;
  String get GetName => _Name;
  Image get GetImageOfPLayer => _playerImage;
  Role get GetRole => _role; //rolün ismi dönmez obje döner
  bool get Getisdead => _isDead;
  int get GetVote => _vote; //Sahip Olduğu Oy sayısı
  String get GetTempTeam => _Tempteam;
  bool get GetSaving => isSaving;
  bool get GetHitBullet => _hitWithBullet;
  bool get GetMuted => muted;
  void setDidYouGetInfos() {
    _didyougetInfos = true;
  }

  void setSaving(bool value) {
    isSaving = value;
  }

  void setHitBullet() {
    _hitWithBullet = true;
  }

  void setJail() {
    _isJail = true;
  }

  void setDead() {
    _isDead = true;
  }

  void setMuted(bool muted) {
    this.muted = muted;
  }

  void SetVote(int Value) {
    // Value always should be 0. Her oylama sonund ahapise gitmemiş ise oylar sıfırlanacak
    _vote = Value;
  }

  void SetRole(Role role) {
    _role = role;
  }

  void SetTempTeam(String Value) {
    _Tempteam = Value;
  }

  void incrementVote() {
    _vote++;
  }

  void decrementvote() {
    _vote--;
  }
}
