import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kurtlar/backend/cache/cache_id.dart';

class AuthService with CacheID {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<User> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  signOut() async {
    SetID(null);
    return await _auth.signOut();
  }

  //kayıt ol fonksiyonu
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

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>>
      fetchUserByUsingCode() async {
    var ref = await _firestore.collection("Users").snapshots();
  
    return ref;
  }

  Future<bool> SetUserImage(String UserID, String imgeUrl) async {
    Map<String, dynamic> updatedField = {"image": imgeUrl};
    var ref =
        await _firestore.collection('Users').doc(UserID).update(updatedField);
    return true;
  }
}
