import 'package:shared_preferences/shared_preferences.dart';

mixin CacheID {
  Future<bool> SetID(String ID) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(CachemanagerID.ID.toString(), ID);
    print("id Set edildi");
    return true;
  }

  Future<String> GetID() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id = pref.getString(CachemanagerID.ID.toString());
    return id;
    
  }
}

enum CachemanagerID { ID }
