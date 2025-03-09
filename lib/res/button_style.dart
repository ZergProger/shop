import 'package:flutter/material.dart';

class AppSButton {
  AppSButton._();

  static final ButtonStyle reg = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Color(0xFFFFDA62)),
      fixedSize: WidgetStateProperty.all(const Size(270, 45)),
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ));
}
