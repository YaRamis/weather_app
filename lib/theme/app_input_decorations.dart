import 'package:flutter/material.dart';

abstract class AppInputDecoration {
  static InputDecoration setCityInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: Colors.teal.shade800,
        width: 2,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(color: Colors.white, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 20,
    ),
    hintText: 'Write city name',
    hintStyle: TextStyle(color: Colors.teal.shade800),
  );
}
