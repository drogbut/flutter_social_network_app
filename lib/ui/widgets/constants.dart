import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_apps/model/my_user.dart';

// user global

 MyUser? myUser;

// colors
const Color white = const Color(0xFFFFFFFF);
const Color base = const Color(0xFFBDBDBD);
const Color baseAccent = const Color(0xFF616161);
const Color pointer = const Color(0xFFF44336);

// images
const AssetImage logoImage = const AssetImage("assets/darkBee.png");
const AssetImage eventImage = const AssetImage("assets/event.jpg");
const AssetImage homeImage = const AssetImage("assets/home.jpg");
const AssetImage profileImage = const AssetImage("assets/profile.jpg");

// Icons
Icon homeIcon = Icon(Icons.home);
Icon friendsIcon = Icon(Icons.group);
Icon notifIcon = Icon(Icons.notification_important);
Icon accountIcon = Icon(Icons.account_circle);
Icon writeIcon = Icon(Icons.border_color);
Icon sendIcon = Icon(Icons.send);
Icon cameraIcon = Icon(Icons.camera_enhance);
Icon galleryIcon = Icon(Icons.photo_library);


// Keys
String keyUid = "uid";
String keyName = "name";
String keySurname = "surname";
String keyFollowers = "followers";
String keyImageUrl = "imageUrl";
String keyFollowings = "followings";

String keyText = "text";
String keyPostId = "postID";
String keyDate = "date";
String keyComments = "comments";
String keyLikes = "likes";