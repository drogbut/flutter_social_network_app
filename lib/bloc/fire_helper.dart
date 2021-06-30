import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

class FireHelper {

  // Auth
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> signIn(String email, String pwd) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: pwd);
    User user = userCredential.user;
    return user;
  }

  Future<User> createAccount(String name, String surname, String email, String pwd) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
    User user = userCredential.user;
    // Creer mon utulisateur pour l'ajouter dans la db
    String uid = user.uid;
    List<dynamic> followers = [];
    List<dynamic> followings = [uid];
    Map<String, dynamic> map = {
      "uid": uid,
      "name": name,
      "surname": surname,
      "followers": followers,
      "followings": followings
    };

    addUserWithOwnID(uid, map);
    return user;
  }

  Future logOut() async => await _auth.signOut();


  // Database
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = firestore.collection('users');

  /// If you'd like to specify your own ID, call the set method on a DocumentReference
  Future<void> addUserWithOwnID(String uid, Map<String, dynamic> map) {
    return users.doc(uid).set(map);
  }

  /// Add a new document with a unique auto-generated ID to a collection
  Future<void> addUserWithID(Map<String, dynamic> map) {
    return users.add(map);
  }


}