import 'package:flutter/material.dart';

class MyText extends Text {
  MyText(
    String data, {
    textAlign: TextAlign.center,
    double fontSize = 17.0,
    FontStyle fontStyle = FontStyle.normal,
    Color color = Colors.white,
  }) : super(
          data,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            fontStyle: fontStyle,
            color: color,
          ),
        );
}
