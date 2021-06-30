import 'package:flutter/material.dart';
import 'package:frontend_apps/ui/widgets/constants.dart';

class MyBarItems extends IconButton {


  MyBarItems({required Icon icon, required VoidCallback onPressed, required bool isSelected}) : super(
    onPressed: onPressed,
    icon: icon,
    color: (isSelected == true) ? pointer : base
  );
}