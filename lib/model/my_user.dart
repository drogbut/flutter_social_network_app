// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend_apps/ui/widgets/constants.dart';

/// MyUser model
class MyUser  {

   late String uid;
   late String name;
   late String surname;
   late String imageUrl;
   late List<dynamic> followers;
   late List<dynamic> followings;
   late DocumentReference ref;
   late String documentId;

  MyUser(DocumentSnapshot snapshot){
    ref = snapshot.reference;
    documentId = snapshot.id;
    Map<String, dynamic> map = snapshot.data();
    uid = map[keyUid];
    name = map[keyName];
    surname = map[keySurname];
    imageUrl = map[keyImageUrl];
    followers = map[keyFollowers];
    followings = map[keyFollowings];
  }

  Map<String, dynamic> toMap(){
    return {
      keyUid: uid,
      keyName: name,
      keySurname: surname,
      keyImageUrl: imageUrl,
      keyFollowers: followers,
      keyFollowings: followings
    };
  }

}
