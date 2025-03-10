import 'package:flutter/material.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10,
        top: 10,
        left: 5,
        right: 5,
      ),
      child: Container(
        width: 370,
        height: 97,
        color: Color.fromARGB(255, 248, 196, 27),
        child: Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
              child: Container(
                width: 90,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Image.network(
                  'https://via.placeholder.com/90x50', // Добавлена заглушка
                  width: 90,
                  height: 80,
                  fit:
                      BoxFit.cover, // Сохранение соотношения сторон изображения
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
