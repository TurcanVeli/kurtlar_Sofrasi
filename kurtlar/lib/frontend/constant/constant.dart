import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:kurtlar/backend/roles/Abdulhey.dart';
import 'package:kurtlar/backend/roles/AslanAkbey.dart';
import 'package:kurtlar/backend/roles/Cakir.dart';
import 'package:kurtlar/backend/roles/Karahanl%C4%B1.dart';
import 'package:kurtlar/backend/roles/dogubey.dart';
import 'package:kurtlar/backend/roles/lazziya.dart';
import 'package:kurtlar/backend/roles/mafiamen.dart';
import 'package:kurtlar/backend/roles/nizammettin.dart';
import 'package:kurtlar/backend/roles/officer.dart';
import 'package:kurtlar/backend/roles/polat.dart';

import '../../backend/roles/BaseRole.dart';
class constant extends StatelessWidget {
  const constant({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container();
  }
}
LazZiya laz = LazZiya();
nizamettin niz = nizamettin();
Polat polat = Polat();
mafiamen mafiaMen = mafiamen();
officer Officer = officer();
AslanAkbey Aslan = AslanAkbey();
Cakir cak = Cakir();
Abdulhey abu = Abdulhey();
Karahanli kara = Karahanli();
DoguBey dogubey = DoguBey();


List<Role> ordinary = [Officer,mafiaMen,polat];
List<Role> deepgoverment = [Aslan,dogubey,abu];
List<Role> mafia = [kara,niz,cak];