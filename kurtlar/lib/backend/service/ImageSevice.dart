import 'package:image_picker/image_picker.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';
import 'package:kurtlar/backend/service/auth.dart';
import 'package:kurtlar/backend/service/storage_service.dart';
import 'dart:io';

class ImageService with CacheID {
  StorageService _storage = StorageService();
  AuthService _set = AuthService();
  //Userın fotosunu günceller
  Future<XFile> UpdateImageOfuser() async {
    XFile image = await ImagePicker().pickImage(source: ImageSource.gallery);
    File imagefile = File(image.path);
    print("Uploading");
    //Resim yüklendi
    var _url = await _storage.uploadImage(imagefile);
    print("İmageUrl ");
    var UserID = await GetID();
    bool status = await _set.SetUserImage(UserID, _url);
    print("Status  " + status.toString());
  }
}
