import 'package:flutter/material.dart';

import 'constants.dart';
import 'my_gradiant.dart';
import 'my_text.dart';

class MyButtonGradiant extends Card {


  MyButtonGradiant({
    required VoidCallback onPressed,
    required String text,
    double elevation: 7.5,
    double width: 300.0,
    double height: 50.0,
    double radius: 20.0
}) : super(
    elevation: 7.5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
    child: Container(
      width: width,
      height: height,
      decoration: MyGradiant(startColor: baseAccent, endColor: base, radius: radius, isHorizontal: true),
      child: MaterialButton(
        onPressed: onPressed,
        child: MyText(text),
      ),
    ),
  );
}