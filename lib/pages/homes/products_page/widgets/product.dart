import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop/repository/shop_repository.dart';
import 'package:shop/repository/product_model.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key});

  final ShopRepository shopRepository = ShopRepository(dio: Dio());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: shopRepository.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Ошибка: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('Нет данных');
        }

        final product = snapshot.data![0]; // Берём первый продукт для примера

        return InkWell(
          onTap: () {
            print("Карточка ${product.title} нажата!");
          },
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Основной контейнер карточки
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 195, 39),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Изображение товара
                    Container(
                      width: 71,
                      height: 71,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(product.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Название товара
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    // Цена товара
                    Text(
                      '${product.price} \$',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Кнопка корзины
              Positioned(
                bottom: 80,
                right: 50,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8), // Исправлено
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 22,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
