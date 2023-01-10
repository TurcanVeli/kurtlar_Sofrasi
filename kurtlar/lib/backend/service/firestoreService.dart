import 'package:cloud_firestore/cloud_firestore.dart';

class firestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> getAllData() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('Users');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    return allData;
  }

  Future<bool> SetUserImage(String UserID, String imgeUrl) async {
    Map<String, dynamic> updatedField = {"image": imgeUrl};
    var ref =
        await _firestore.collection('Users').doc(UserID).update(updatedField);
    return true;
  }
}
