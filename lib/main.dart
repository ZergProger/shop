import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop/pages/homes/basket_page/basket_page.dart';
import 'package:shop/repository/shop_repository.dart';
import 'package:shop/res/theme.dart';
import 'package:shop/utils/routes.dart';
import 'package:shop/utils/routes_name.dart';

void main() {
  ShopRepository(dio: Dio());

  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: route(BasketPage),
      routes: generateRoutes(),
    );
  }
}
