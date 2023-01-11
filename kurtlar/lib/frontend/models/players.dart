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
  int get GetVote => _vote;
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

  /* This function checks if Abdulhey hits other roles */
  void setHitBullet() {
    _hitWithBullet = true;
  }

  /* This function checks if some roles has gone the jail */
  void setJail() {
    _isJail = true;
  }

  /* This function checks if some roles are killed */
  void setDead() {
    _isDead = true;
  }
  void setUnMutedNight(int value){
    unmutednight = value;
  }
  void incrementPassedNight(){
    passednight++;
  }

  /* This function checks if some roles is muted by KARAHANLI */
  void setMuted(bool muted) {
    this.muted = muted;
  }

  /* This function is used for vote someone. Value is gonna be made 0 after the vote */
  void SetVote(int Value) {
    _vote = Value;
  }

  /* This function set the role of someone */
  void SetRole(Role role) {
    _role = role;
  }

  /* This function set the team of roles */
  void SetTempTeam(String Value) {
    _Tempteam = Value;
  }

  /* This function increases the vote */
  void incrementVote() {
    _vote++;
  }

  /* This function decreases the vote */
  void decrementvote() {
    _vote--;
  }
}
