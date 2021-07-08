// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend_apps/ui/widgets/constants.dart';

/// MyUser model
class MyUser  {

    String? uid;
    String? name;
    String? surname;
    String? imageUrl;
    List<dynamic>? followers;
    List<dynamic>? followings;
    DocumentReference? ref;
    String? documentId;

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
