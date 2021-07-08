import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend_apps/bloc/fire_helper.dart';
import 'package:frontend_apps/model/my_user.dart';
import 'package:frontend_apps/ui/screens/loading.dart';
import 'package:frontend_apps/ui/widgets/constants.dart';
import 'package:frontend_apps/ui/widgets/my_bar_items.dart';
import 'package:frontend_apps/ui/widgets/widgets.dart';
import 'package:frontend_apps/ui/pages/pages.dart';

class MainAppController extends StatefulWidget {
  final String uid;

  MainAppController({Key? key, required this.uid}) : super(key: key);

  @override
  _MainAppControllerState createState() => _MainAppControllerState();
}

class _MainAppControllerState extends State<MainAppController> {

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  late StreamSubscription subscription;
  //late MyUser myUser;

  int index = 0;

  @override
  void initState() {
    subscription =
        FireHelper().users.doc(widget.uid).snapshots().listen((document) {
          setState(() {
            myUser = MyUser(document);
            print("[MainAppController] " + myUser!.name!);
          });
        });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return (myUser == null)
        ? Loading()
        : Scaffold(
      key: _scaffoldKey,
      backgroundColor: base,
      body: showPage(index),
      bottomNavigationBar: MyBottomBar(items: [
        MyBarItems(icon: homeIcon, onPressed: (() => buttonSelected(0)), isSelected: (index == 0)),
        MyBarItems(icon: friendsIcon, onPressed: (() => buttonSelected(1)), isSelected: (index == 1)),
        Container(width: 0, height: 0,),
        MyBarItems(icon: notifIcon, onPressed: (() => buttonSelected(2)), isSelected: (index == 2)),
        MyBarItems(icon: accountIcon, onPressed: (() => buttonSelected(3)), isSelected: (index == 3)),
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => null),
        backgroundColor: pointer,
        child: MyBarItems(icon: writeIcon, onPressed: write, isSelected: false,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  write(){
    _scaffoldKey.currentState!.showBottomSheet((context) => ModalBottomSheet());
  }

  buttonSelected(int index) {
    print(index);
    setState(() {
      this.index = index;
    });
  }

  Widget showPage(int index) {
    switch(index) {
      case 0 : return FeedPage();
      case 1 : return UsersPage();
      case 2 : return NotifPage();
      case 3 : return ProfilPage();
      default : return FeedPage();
    }
  }



}
