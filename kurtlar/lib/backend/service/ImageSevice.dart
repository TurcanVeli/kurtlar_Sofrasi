import 'package:image_picker/image_picker.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';
import 'package:kurtlar/backend/service/auth.dart';
import 'package:kurtlar/backend/service/storage_service.dart';
import 'dart:io';

class ImageService with CacheID {
  /* Storage service and authentication service was created in there */
  StorageService _storage = StorageService();
  AuthService _set = AuthService();
  
  /* This function updates the image of user */
  Future<XFile> UpdateImageOfuser() async {
    XFile image = await ImagePicker().pickImage(source: ImageSource.gallery);
    File imagefile = File(image.path);
    //Resim yüklendi
    var _url = await _storage.uploadImage(imagefile);
    var UserID = await GetID();
    bool status = await _set.SetUserImage(UserID, _url);
  }
}
