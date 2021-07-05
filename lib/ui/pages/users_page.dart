import 'package:flutter/material.dart';
import 'package:frontend_apps/model/my_user.dart';
import 'package:frontend_apps/ui/widgets/my_text.dart';

class UsersPage extends StatefulWidget {
 /* const UsersPage({Key? key, required this.myUser}) : super(key: key);
  final MyUser myUser;*/

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MyText("users Page"),
      ),
    );
  }
}
