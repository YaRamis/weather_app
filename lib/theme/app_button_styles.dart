import 'package:flutter/material.dart';

abstract class AppButtonStyles {
  static final setCityButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    backgroundColor: MaterialStateProperty.all(Colors.teal.shade800),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  );
}
