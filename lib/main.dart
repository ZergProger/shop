import 'package:flutter/material.dart';
import 'package:shop/pages/authorization/register/user_register_page/user_register_page.dart';
import 'package:shop/utils/routes.dart';
import 'package:shop/utils/routes_name.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: route(UserRegisterPage),
      routes: generateRoutes(),
    );
  }
}
