import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

/* This is the class upload new image in profile_view.dart file */

class StorageService {
  /* FirebaseStorage was created in there */
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

/* This function uplod the image */
  Future<String> uploadImage(File file) async {
    var uploadTask = _firebaseStorage
        .ref()
        .child(
            "${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}") //uniqe olması için zamzn bazlı
        .putFile(file);

    uploadTask.snapshotEvents.listen((event) {});

    var storageRef = await uploadTask;

    /* This returns the URL of image after the upload of image */
    return await storageRef.ref.getDownloadURL();
  }
}
