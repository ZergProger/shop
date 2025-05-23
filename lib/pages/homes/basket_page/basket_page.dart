import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/basket/bloc/basket_bloc.dart';
import 'package:shop/pages/homes/basket_page/widgets/basket_product.dart';
import 'package:shop/pages/homes/basket_page/widgets/basket_recomend_product.dart';
import 'package:shop/pages/homes/widgets/app_bar.dart';
import 'package:shop/pages/homes/widgets/bottom_bar.dart';
import 'package:shop/pages/homes/widgets/icon_button_more_vert.dart';
import 'package:shop/repository/bloc/product_bloc.dart';
import 'package:shop/res/texts_style.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppBarText(title: 'Basket'),
        actions: [
          IconButtonMoreVert(),
        ],
      ),
      body: Column(
        children: [
          // Список корзины с вертикальной прокруткой
          BlocBuilder<BasketBloc, BasketState>(
            builder: (context, state) {
              return SizedBox(
                height: 450,
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) => BasketProduct(
                    products: state.items[index],
                  ),
                ),
              );
            },
          ),

          // Блок с рекомендациями
          Padding(
            padding: EdgeInsets.only(bottom: 25, top: 25),
            child: Container(
              height: 20,
              width: screenWidth,
              color: Color.fromARGB(255, 255, 196, 0),
              child: Center(
                child: Text(
                  'Рекомендации',
                  style: AppSTexts.recomend,
                ),
              ),
            ),
          ),

          // Горизонтальный ListView для рекомендаций
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: const CircularProgressIndicator(),
              );
            } else if (state is ProductEmpty) {
              return const Center(
                  child: Text(
                'data not found',
                style: TextStyle(color: Colors.black),
              ));
            } else if (state is ProductLoaded) {
              return SizedBox(
                height:
                    150, // Устанавливаем высоту контейнера с горизонтальным списком
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Горизонтальная прокрутка
                  itemCount: state.products.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                        right: 20, left: 20), // Отступ между элементами
                    child: BasketRecommendProduct(
                      products: state.products[index],
                    ),
                  ),
                ),
              );
            }
            return SizedBox();
          }),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
