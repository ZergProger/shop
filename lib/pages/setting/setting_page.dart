import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/authorization/abstract_authorization.dart';
import 'package:shop/authorization/authorization.dart';
import 'package:shop/authorization/bloc/authorization_bloc.dart';
import 'package:shop/pages/authorization/register/user_register_page/user_register_page.dart';
import 'package:shop/pages/homes/widgets/app_bar.dart';
import 'package:shop/utils/routes_name.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(title: 'Setting'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // SwitchListTile(
          //   title: const Text('Enable Dark Mode'),
          //   subtitle: const Text('Change the theme of the app'),
          //   value: isDarkMode,
          //   onChanged: (bool value) {
          //     setState(() {
          //       isDarkMode = value;
          //     });
          //   },
          //   activeColor: Colors.teal,
          //   activeTrackColor: Colors.teal[200],
          //   inactiveThumbColor: Colors.grey,
          //   inactiveTrackColor: Colors.grey[300],
          // ),
          ElevatedButton(
              onPressed: () {
                context.read<AuthorizationBloc>().add(AuthorizationLogout());
                Navigator.pushReplacementNamed(context, route(UserRegisterPage));
              },
              child: Text('sing Out')),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
