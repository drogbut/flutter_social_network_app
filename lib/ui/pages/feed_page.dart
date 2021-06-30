import 'package:flutter/material.dart';
import 'package:frontend_apps/model/my_user.dart';
import 'package:frontend_apps/ui/widgets/my_text.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key, required this.myUser}) : super(key: key);
  final MyUser myUser;

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MyText("Fil d'actuialite"),
      ),
    );
  }
}
