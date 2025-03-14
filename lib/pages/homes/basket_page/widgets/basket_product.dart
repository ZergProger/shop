import 'package:flutter/material.dart';
import 'package:shop/repository/product_model.dart';

class BasketProduct extends StatelessWidget {
  const BasketProduct({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        width: double.infinity, // Автоматическая ширина
        height: 110,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 196, 0), // Фон
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10), // Отступы вокруг картинки
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5), // Скругление углов
                child: Image.network(
                  products.image, // URL изображения
                  fit: BoxFit.cover,
                  width: 90,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(width: 10), // Отступ между изображением и текстом
            Expanded(
              // Расширяем область для текста
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    products.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // Обрезка текста
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${products.price} \$',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
