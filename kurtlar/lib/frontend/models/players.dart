import 'package:flutter/material.dart';
import '../../backend/models/BaseRole.dart';

class Players {
  String _Name;
  Image _playerImage;
  Role _role;
  int _vote = 0;
  String _Tempteam = "None";
  Players(this._Name);
  bool muted = false;
  bool isSaving = false;

  bool _isJail = false;
  bool _isDead = false;
  bool _hitWithBullet = false;
  bool _didyougetInfos = false;

  bool get GetDidYougetInfos => _didyougetInfos;
  String get GetName => _Name;
  Image get GetImageOfPLayer => _playerImage;
  Role get GetRole => _role;
  bool get Getisdead => _isDead;
  int get GetVote => _vote;
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
