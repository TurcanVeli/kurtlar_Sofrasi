import 'package:shared_preferences/shared_preferences.dart';

/* ID of user is keeping the locale of phone. */
mixin CacheID {
  /* This method is used for to set ID */
  Future<bool> SetID(String ID) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(CachemanagerID.ID.toString(), ID);
    return true;
  }
  /* This method is used for to get ID */
  Future<String> GetID() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id = pref.getString(CachemanagerID.ID.toString());
    return id;
    
  }
}

enum CachemanagerID { ID }
