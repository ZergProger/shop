import 'package:flutter/material.dart';
import 'package:shop/repository/product_model.dart';

class BasketProduct extends StatelessWidget {
  const BasketProduct({super.key, required this.items});

  final ProductModel items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 5,
        right: 5,
      ),
      child: Container(
        width: 310,
        height: 97,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 196, 0), // Цвет фона
          borderRadius: BorderRadius.circular(5), // Радиус скругления углов
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(5), // Отступы вокруг картинки
              child: Container(
                width: 90,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white, // Цвет фона контейнера для изображения
                  borderRadius:
                      BorderRadius.circular(5), // Радиус скругления углов
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(5), // Скругляем углы изображения
                  child: Image.network(
                    '', // Укажите URL изображения
                    fit: BoxFit
                        .cover, // Растягиваем изображение, чтобы оно заполнило контейнер
                    width: 90,
                    height: 80,
                  ),
                ),
              ),
            ),
            // Вы можете добавить другие элементы в Row, например текст или кнопки
          ],
        ),
      ),
    );
  }
}
