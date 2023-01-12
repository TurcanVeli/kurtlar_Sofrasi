import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LAGUAGE_CODE = 'languageCode';

const String ENGLISH = "en";
const String TURKISH = "tr";
const String ITALIAN  = "it";
const String GERMANY = "de";
const String ESPANOL = "es"; 

/* The pre-selected language is saved with this code */
Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

/* The pre-selected language is getting with this method*/
Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}
/* This method returns the language what you chosen */
Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, "US");
    case TURKISH:
      return Locale(TURKISH, "TUR");
    case ESPANOL:
      return Locale(ESPANOL,  "ES");
    case GERMANY:
      return Locale(GERMANY, "DE");
    case ITALIAN:
      return Locale(ITALIAN, "IT");

    default:
      return Locale(TURKISH, "TUR");
  }
}

AppLocalizations translate(BuildContext context) {
  return AppLocalizations.of(context);
}
