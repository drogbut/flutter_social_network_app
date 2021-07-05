import 'package:flutter/material.dart';
import 'package:frontend_apps/model/my_user.dart';
import 'package:frontend_apps/ui/widgets/my_text.dart';

class NotifPage extends StatefulWidget {
  /*const NotifPage({Key? key, required this.myUser}) : super(key: key);
  final MyUser myUser;*/

  @override
  _NotifPageState createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MyText("Notification"),
      ),
    );
  }
}
