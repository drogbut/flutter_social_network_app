import 'package:flutter/material.dart';
import 'package:frontend_apps/ui/widgets/constants.dart';

class MyBottomBar extends BottomAppBar {


  MyBottomBar({required List<Widget> items}) : super(
    color: baseAccent,
    shape: CircularNotchedRectangle(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    )
  );
}