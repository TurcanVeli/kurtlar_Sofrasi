import 'package:flutter/material.dart';
import '../../backend/models/BaseRole.dart';

class Players {
  String _Name;
  int _coin;
  int _point;
  String _userId;
  String _playerImage;
  String _invitecode;
  Role _role; //Hangi rollde olduğu
  int _vote = 0;
  String _Tempteam = "None";
  int passednight = 1;
  int unmutednight = -1;

  Players(this._Name, this._userId, this._playerImage, this._coin, this._point,
      this._invitecode);

  bool muted = false;
  bool isSaving = false;
//Defaul value = FAlse
  bool _isJail = false;
  bool _isDead = false;
  bool _hitWithBullet = false;
  bool _didyougetInfos = false;

  int get getUnMutedNight => unmutednight;
  int get GetPassedNight => passednight;
  String get GetCode => _invitecode; //Dogu görevi için
  String get GetuserID => _userId;
  int get getCoin => _coin;
  int get getPoint => _point;
  String get GetImageUrl => _playerImage;
  bool get GetDidYougetInfos => _didyougetInfos;
  String get GetName => _Name;
  Role get GetRole => _role; //rolün ismi dönmez obje döner
  bool get Getisdead => _isDead;
  int get GetVote => _vote; //Sahip Olduğu Oy sayısı
  String get GetTempTeam => _Tempteam;
  bool get GetSaving => isSaving;
  bool get GetHitBullet => _hitWithBullet;
  bool get GetMuted => muted;
  void setDidYouGetInfos(bool value) {
    _didyougetInfos = false;
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
  void setUnMutedNight(int value){
    unmutednight = value;
  }
  void incrementPassedNight(){
    passednight++;
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
