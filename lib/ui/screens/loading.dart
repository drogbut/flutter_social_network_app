import 'package:flutter/material.dart';
import 'package:frontend_apps/ui/widgets/constants.dart';
import 'package:frontend_apps/ui/widgets/my_text.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: MyText("Chargement...", color: baseAccent,),
          )),
    );
  }
}
