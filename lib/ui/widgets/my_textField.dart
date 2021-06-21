import 'package:flutter/material.dart';

class MyTextFiled extends TextField {

  MyTextFiled({
    required TextEditingController controller,
    TextInputType type: TextInputType.text,
    bool obscure = false,
    Icon? icon,
    String hint: ""
  }): super(
      controller: controller,
    keyboardType: type,
    obscureText: obscure,
    decoration: InputDecoration(
      hintText: hint,
      icon: icon,
    )
  );
}