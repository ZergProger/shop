import 'package:flutter/material.dart';
import 'package:shop/pages/setting/setting_page.dart';
import 'package:shop/utils/routes_name.dart';

class IconButtonMoreVert extends StatelessWidget {
  const IconButtonMoreVert({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      iconColor: Colors.white,
      itemBuilder: (context) => [
        PopupMenuItem<String>(
            value: 'Setting',
            child: Row(
              children: const [
                Icon(Icons.settings),
                SizedBox(width: 10),
                Text('Setting'),
              ],
            ),
            onTap: () => Navigator.pushNamed(context, route(SettingPage))),
      ],
    );
  }
}
