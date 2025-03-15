import 'package:flutter/material.dart';

class IconButtonMoreVert extends StatelessWidget {
  const IconButtonMoreVert({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      iconColor: Colors.white,
      itemBuilder: (context) => [],
    );
  }
}
