import 'package:image_picker/image_picker.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';
import 'package:kurtlar/backend/service/auth.dart';
import 'package:kurtlar/backend/service/storage_service.dart';
import 'dart:io';
import 'package:kurtlar/backend/service/firestoreService.dart';

class ImageService with CacheID {
  /* Storage service and authentication service was created in there */
  StorageService _storage = StorageService();
  firestoreService _store = firestoreService();
  
  /* This function updates the image of user */
  Future<XFile> UpdateImageOfuser() async {
    XFile image = await ImagePicker().pickImage(source: ImageSource.gallery);
    File imagefile = File(image.path);
    //Resim yüklendi
    var _url = await _storage.uploadImage(imagefile);
    var UserID = await GetID();
    bool status = await _store.SetUserImage(UserID, _url);
  }
}
