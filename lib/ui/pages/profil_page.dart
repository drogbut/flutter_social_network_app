import 'package:flutter/material.dart';
import 'package:frontend_apps/model/my_user.dart';
import 'package:frontend_apps/ui/widgets/my_text.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key, required this.myUser}) : super(key: key);
  final MyUser myUser;

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MyText("Profil Page"),
      ),
    );
  }
}
