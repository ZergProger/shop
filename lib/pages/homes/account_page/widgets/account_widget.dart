import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Container(
        width: 290,
        height: 110,
        decoration: BoxDecoration(
            color: Color.fromARGB(138, 211, 211, 211),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          clipBehavior:
              Clip.none, // Чтобы элементы выходили за пределы контейнера
          children: [
            // Основной контейнер с содержимым
            // Круг, который выходит за границы контейнера
            Positioned(
              top: -5, // Сдвигаем круг вверх
              left: -35, // Сдвигаем круг влево
              child: Container(
                width: 120, // Ширина круга
                height: 120, // Высота круга
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 196, 27), // Цвет круга
                  shape: BoxShape.circle, // Формируем круг
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
