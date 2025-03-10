import 'package:flutter/material.dart';
import 'package:shop/pages/homes/widgets/bottom_bar.dart';
import 'package:shop/pages/homes/products_page/widgets/product.dart';
import 'package:shop/pages/homes/widgets/search_form.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: SearchForm()),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Две карточки в ряду
            crossAxisSpacing: 20, // Расстояние между колонками
            mainAxisSpacing: 10, // Расстояние между рядами
            childAspectRatio: 0.8, // Пропорции карточек (чуть вытянутые)
          ),
          itemCount: 8, // Количество карточек
          itemBuilder: (context, index) {
            return ProductCard();
          },
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
