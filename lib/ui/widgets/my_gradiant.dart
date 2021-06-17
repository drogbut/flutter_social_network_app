import 'package:flutter/material.dart';

class MyGradiant extends BoxDecoration {

  static final Alignment begin = Alignment(0.0, 0.0);
  static final Alignment endHorizontal = Alignment(1.0, 0.0);
  static final Alignment endVertical = Alignment(0.0, 1.0);

  MyGradiant({
    required Color startColor,
    required Color endColor,
    bool isHorizontal: false,
    double radius:0.0
  }) : super(
    gradient: LinearGradient(
        colors: [startColor, endColor],
      begin: begin,
      end: (isHorizontal) ? endHorizontal: endVertical,
    ),
    borderRadius: BorderRadius.all(Radius.circular(radius))
  );
}