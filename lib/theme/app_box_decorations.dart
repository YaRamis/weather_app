import 'package:flutter/material.dart';

abstract class AppBoxDecorations {
  static BoxDecoration defaultDarkBoxDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(50)),
    color: Colors.teal.shade800,
  );

  static BoxDecoration defaultLightBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: Colors.teal,
  );

  static BoxDecoration currentWeatherBoxDecoration = BoxDecoration(
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(50),
      bottomRight: Radius.circular(50),
    ),
    color: Colors.teal.shade800,
  );
}
