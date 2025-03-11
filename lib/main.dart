import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop/pages/homes/basket_page/basket_page.dart';
import 'package:shop/repository/abstract_repository.dart';
import 'package:shop/repository/bloc/product_bloc.dart';
import 'package:shop/repository/shop_repository.dart';
import 'package:shop/res/theme.dart';
import 'package:shop/utils/routes.dart';
import 'package:shop/utils/routes_name.dart';
import 'package:get_it/get_it.dart';

final productsBloc = ProductBloc(GetIt.I<AbstractProductRepository>());
final Dio dio = Dio();

void main() {
  GetIt.I.registerLazySingleton<AbstractProductRepository>(
      () => ShopRepository(dio: dio));
  GetIt.I.registerSingleton(ShopRepository(dio: dio));

  runApp(MultiProvider(
    providers: [
      BlocProvider(
        create: (context) => ProductBloc(
          GetIt.I<AbstractProductRepository>(),
        ),
      ),
    ],
    child: const Main(),
  ));
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
