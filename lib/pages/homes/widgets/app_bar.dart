import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 294,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
