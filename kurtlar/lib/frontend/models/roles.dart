import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
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

LazZiya laz = LazZiya();
nizamettin niz = nizamettin();

mafiamen mafiaMen = mafiamen();
officer Off = officer();
AslanAkbey Aslan = AslanAkbey();
Abdulhey abu = Abdulhey();
Karahanli kara = Karahanli();
DoguBey dogubey = DoguBey();

List<Role> ordinary = [Off, mafiaMen, Polat.instance];
List<Role> deepgoverment = [Aslan, dogubey, abu];
List<Role> mafia = [kara, niz, laz];
