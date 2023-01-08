import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<User> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  signOut() async {
    return await _auth.signOut();
  }

  //kayıt ol fonksiyonu
  Future<User> createPerson(
      String name, String email, String password, String invitecode) async {

    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection("Users").doc(user.user.uid).set({
      'userName': name,
      'email': email,
      "invitecode": invitecode,
      "coin": 0,
      "point": 0,
      "image": "No Image",
      "id": user.user.uid.toString()
    });

    return user.user;
  }
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> fetchUserByUsingCode () async {
        var ref = await _firestore.collection("Users").snapshots();
        
        
        return ref;
  }
}
