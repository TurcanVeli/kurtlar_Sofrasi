import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

//TODO edit profildeki resim değiştirmek için kullanulacak. Storagye resim yüklemek için kullanılan class
class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadImage(File file) async {
    var uploadTask = _firebaseStorage
        .ref()
        .child(
            "${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}") //uniqe olması için zamzn bazlı
        .putFile(file);

    uploadTask.snapshotEvents.listen((event) {});

    var storageRef = await uploadTask;

    return await storageRef.ref
        .getDownloadURL(); //Yükleme yaptıktan sonra url dönecek
  }
}
