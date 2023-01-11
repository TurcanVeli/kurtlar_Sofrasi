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

  Future<bool> IncementUserCoin(String UserID, int currentpoint) async {
    Map<String, dynamic> updatedField = {"point": currentpoint + 50};
    var ref =
        await _firestore.collection('Users').doc(UserID).update(updatedField);
    return true;
  }

  Future<bool> IncrementUserPoint(String UserID, int currentCoin) async {
    Map<String, dynamic> updatedField = {"coin": currentCoin + 50};
    var ref =
        await _firestore.collection('Users').doc(UserID).update(updatedField);
    return true;
  }

  Future<bool> SetUserName(String UserID, String userName) async {
    Map<String, dynamic> updatedField = {"userName": userName};
    var ref =
        await _firestore.collection('Users').doc(UserID).update(updatedField);

    return true;
  }
}
