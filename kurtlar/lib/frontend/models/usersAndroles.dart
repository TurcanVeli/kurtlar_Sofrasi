import 'package:kurtlar/frontend/models/players.dart';

import '../../backend/models/BaseRole.dart';

import 'package:kurtlar/backend/models/Abdulhey.dart';
import 'package:kurtlar/backend/models/AslanAkbey.dart';
import 'package:kurtlar/backend/models/Karahanli.dart';
import 'package:kurtlar/backend/models/dogubey.dart';
import 'package:kurtlar/backend/models/lazziya.dart';
import 'package:kurtlar/backend/models/mafiamen.dart';
import 'package:kurtlar/backend/models/nizammettin.dart';
import 'package:kurtlar/backend/models/officer.dart';
import 'package:kurtlar/backend/models/polat.dart';

import '../../backend/models/BaseRole.dart';

List<Role> ordinary = [officer.instance, mafiamen.instance, Polat.instance];
List<Role> deepgoverment = [
  AslanAkbey.instance,
  DoguBey.instance,
  Abdulhey.instance
];
List<Role> mafia = [Karahanli.instance, nizamettin.instance, LazZiya.instance];

List<Players> USERS = [];

List CloningUser = [...USERS];

List<Role> addedRoles = [];
List<Players> MafiasUsers = [];
List<Players> GovermentUsers = [];
Players PolatUser = Players(
    "Oyunda Yok",
    "1",
    "https://firebasestorage.googleapis.com/v0/b/kurtlarsofrasi-1b36c.appspot.com/o/deafultAvatar.png?alt=media&token=02779a75-228e-412f-b524-befbe8bec3c8",
    1,
    1,
    "0");
