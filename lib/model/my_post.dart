

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend_apps/model/my_user.dart';
import 'package:frontend_apps/ui/widgets/constants.dart';

class MyPost {

  late DocumentReference ref;
  late String documentID;
  late String date;
  late String id;
  late String text;
  late String userId;
  late String imageUrl;
  late List<dynamic> likes;
  late List<dynamic> comments;

  late MyUser myUser;

  MyPost(MyUser myUser, DocumentSnapshot snapshot) {
    this.ref = snapshot.reference;
    this.documentID = snapshot.id;
    this.myUser = myUser;

    Map<String, dynamic> map = snapshot.data();
    id = map[keyPostId];
    text = map[keyText];
    date = map[keyDate];
    userId = map[keyUid];
    imageUrl = map[keyImageUrl];
    likes = map[keyLikes];
    comments = map[keyComments];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      keyPostId: id,
      keyUid: userId,
      keyDate: date,
      keyImageUrl: imageUrl,
      keyLikes: likes,
      keyComments: comments,
      keyText: text,
    };

    return map;
  }


}