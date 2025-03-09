import 'package:flutter/material.dart';
import 'package:shop/pages/authorization/register/admin_register_page/admin_register_page.dart';
import 'package:shop/pages/authorization/register/user_register_page/user_register_page.dart';
import 'package:shop/utils/routes_name.dart';

Map<String, WidgetBuilder> generateRoutes() {
  return {
    // route(NameClass): (_) => const NameClass(),
    route(UserRegisterPage): (_) => UserRegisterPage(),
    route(AdminRegisterPage): (_) => AdminRegisterPage(),
    route(UserRegisterPage): (_) => UserRegisterPage(),
  };
}
