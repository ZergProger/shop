import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/main.dart';
import 'package:shop/pages/homes/widgets/app_bar.dart';
import 'package:shop/pages/homes/widgets/bottom_bar.dart';
import 'package:shop/pages/homes/products_page/widgets/product.dart';
import 'package:shop/pages/homes/widgets/icon_button_more_vert.dart';
import 'package:shop/repository/bloc/product_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController controllerSearch = TextEditingController();
  final Completer<void> _refreshCompleter = Completer<void>();

  @override
  void initState() {
    super.initState();
    // Triggering the first load of products
    productsBloc.add(ProductLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppBarText(title: 'products'),
        actions: [IconButtonMoreVert()],
      ),
      bottomNavigationBar: BottomBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          productsBloc.add(ProductLoad());
          _refreshCompleter.complete(); // Mark the refresh as complete
          return _refreshCompleter.future; // Return the future to await it
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          bloc: productsBloc,
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: const CircularProgressIndicator());
            } else if (state is ProductEmpty) {
              return const Center(
                child: Text(
                  'Data not found',
                  style: TextStyle(color: Colors.black),
                ),
              );
            } else if (state is ProductLoaded) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(products: state.products[index]);
                  },
                ),
              );
            } else if (state is ProductFailed) {
              return Center(
                child: Text('Error: ${state.exception.toString()}'),
              );
            }
            return const SizedBox(); // Handle the case where no state is returned
          },
        ),
      ),
    );
  }
}
