import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {super.key,
      required this.controller,
      required this.decoration,
      required this.width});

  final TextEditingController controller;
  final InputDecoration decoration;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      color: Color(0xFFFFDA62),
      child: TextFormField(
        controller: controller,
        decoration: decoration,
      ),
    );
  }
}
