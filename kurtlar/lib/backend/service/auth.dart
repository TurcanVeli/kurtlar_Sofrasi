import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';

class AuthService with CacheID {
  /* Authentication and firestore were created with these codes */
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /* This is signIn function of firebase */
  Future<User> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  /* This is the sıngOut function of firebase */
  signOut() async {
    SetID(null);
    return await _auth.signOut();
  }

  /* This function is used for the create a person in firestore and authentication page */
  Future<User> createPerson(
      String name, String email, String password, String invitecode) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    String defaultImageUrl =
        "https://firebasestorage.googleapis.com/v0/b/kurtlarsofrasi-1b36c.appspot.com/o/deafultAvatar.png?alt=media&token=02779a75-228e-412f-b524-befbe8bec3c8";

    await _firestore.collection("Users").doc(user.user.uid).set({
      'userName': name,
      'email': email,
      "invitecode": invitecode,
      "coin": 0,
      "point": 0,
      "image": defaultImageUrl,
      "id": user.user.uid.toString()
    });

    return user.user;
  }

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
