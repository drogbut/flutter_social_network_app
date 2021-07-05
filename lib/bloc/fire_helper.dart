import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frontend_apps/ui/widgets/constants.dart';

class FireHelper {

  FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseStorage storageInstance = FirebaseStorage.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = firestore.collection('users');
  final  storageUser = storageInstance.ref('users');
  final  storagePosts = storageInstance.ref('posts');


  // Auth
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

  /// If you'd like to specify your own ID, call the set method on a DocumentReference
  Future<void> addUserWithOwnID(String uid, Map<String, dynamic> map) {
    return users.doc(uid).set(map);
  }

  /// Add a new document with a unique auto-generated ID to a collection
  Future<void> addUserWithID(Map<String, dynamic> map) {
    return users.add(map);
  }

  addPost(String uid, String text, File file) {
    int date = DateTime.now().microsecondsSinceEpoch.toInt();
    List<dynamic> likes = [];
    List<dynamic> comments = [];

    Map<String, dynamic> map = {
      keyUid: uid,
      keyDate: date,
      keyLikes: likes,
      keyComments: comments,
    };

    if(text != ""){
      map[keyText] = text;
    }

    if(file.path != ""){
      Reference ref = storagePosts.child(uid).child(date.toString());
      addImage(file, ref).then((value){
        String imageUrl = value;
        map[imageUrl] = imageUrl;
        users.doc(uid).collection("posts").doc().set(map);
      });
    }else{
      users.doc(uid).collection("posts").doc().set(map);
    }

  }

  // Storage


  Future<String> addImage(File file, Reference ref) async {
    String imageUrl = "";
    UploadTask task = ref.putFile(file);
    try{
      TaskSnapshot snapshot = await task.whenComplete(() =>
          print("Debug Image: put file on ref=" + task.toString() +" is completed")
      );
      imageUrl = await snapshot.ref.getDownloadURL();
    } on FirebaseException catch(e) {
      print(task.snapshot);

      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
    }
    return imageUrl;
  }



}