import 'package:kurtlar/backend/roles/lazziya.dart';
import 'package:kurtlar/backend/roles/mafiamen.dart';
import 'package:kurtlar/backend/roles/nizammettin.dart';
import 'package:kurtlar/backend/roles/officer.dart';
import 'package:kurtlar/backend/roles/polat.dart';

import '../../backend/roles/BaseRole.dart';

LazZiya laz = LazZiya();
nizamettin niz = nizamettin();
Polat polat = Polat();
mafiamen mafiaMen = mafiamen();
officer Officer = officer();

List mafias = [niz, laz, mafiaMen];
List goverment = [polat, Officer];
