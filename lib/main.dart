import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shop/authorization/abstract_authorization.dart';
import 'package:shop/authorization/authorization.dart';
import 'package:shop/authorization/bloc/authorization_bloc.dart';
import 'package:shop/basket/bloc/basket_bloc.dart';
import 'package:shop/firebase_options.dart';
import 'package:shop/history/bloc/history_bloc.dart';
import 'package:shop/pages/authorization/register/user_register_page/user_register_page.dart';
import 'package:shop/pages/homes/products_page/products_page.dart';
import 'package:shop/repository/abstract_repository.dart';
import 'package:shop/repository/bloc/product_bloc.dart';
import 'package:shop/repository/models/product_model.dart';
import 'package:shop/repository/shop_repository.dart';
import 'package:shop/res/theme.dart';
import 'package:shop/utils/routes.dart';
import 'package:shop/utils/routes_name.dart';
import 'package:get_it/get_it.dart';

final authorizationBloc = AuthorizationBloc(GetIt.I<AbstractAuthorization>());
final productsBloc = ProductBloc(GetIt.I<ShopRepository>());
final basketBloc = BasketBloc();
final historyBloc = HistoryBloc();

final Dio dio = Dio();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final FirebaseAuth auth = FirebaseAuth.instance;

  await Hive.initFlutter();

  const String boxName = 'productBox';
  Hive.registerAdapter(ProductModelAdapter());
  final productBox = await Hive.openBox<ProductModel>(boxName);

  GetIt.I.registerSingleton(boxName);
  GetIt.I.registerSingleton(productBox);
  GetIt.I.registerLazySingleton<AbstractProductRepository>(
      () => ShopRepository(dio: dio, productBox: productBox));
  GetIt.I.registerLazySingleton<AbstractAuthorization>(
      () => Authorization(auth: auth));
  GetIt.I.registerSingleton(Authorization(auth: auth));
  GetIt.I.registerSingleton(ShopRepository(dio: dio, productBox: productBox));
  GetIt.I.registerSingleton(productsBloc);
  GetIt.I.registerSingleton(auth);
  GetIt.I.registerSingleton(dio);
  GetIt.I.registerSingleton(AbstractAuthorization);
  GetIt.I.registerSingleton(authorizationBloc);
  GetIt.I.registerSingleton(basketBloc);
  GetIt.I.registerSingleton(historyBloc);

  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (context) => productsBloc),
        BlocProvider(create: (context) => authorizationBloc),
        BlocProvider(create: (context) => basketBloc),
        BlocProvider(create: (context) => historyBloc),
      ],
      child: const Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: route(
        GetIt.I<AbstractAuthorization>().user != null
            ? ProductsPage
            : UserRegisterPage,
      ),
      routes: generateRoutes(),
    );
  }
}
