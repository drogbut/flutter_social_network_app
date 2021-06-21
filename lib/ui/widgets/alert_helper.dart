import 'package:flutter/material.dart';
import 'package:frontend_apps/ui/widgets/my_text.dart';
import 'constants.dart';

class AlertHelper {

  Future<void> error(BuildContext context, String error) async {
    MyText title = MyText("Erreur", color: Colors.black,);
    MyText subTitle = MyText(error, color: Colors.black,);
    return showDialog(
      context: context,
        barrierDismissible: true,
        builder: (BuildContext ctx) {
          return AlertDialog( title: title, content: subTitle, actions: [close(ctx, "ok")],);
        }
    );
  }

  MaterialButton close(BuildContext buildContext, String text) {
    return MaterialButton(
        onPressed: (() => Navigator.pop(buildContext)),
      child: MyText(text, color: pointer,),
    );
  }
}