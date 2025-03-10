import 'package:flutter/material.dart';

class BasketRecommendProduct extends StatelessWidget {
  const BasketRecommendProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5, left: 5),
        child: Container(
          width: 140,
          height: 150,
          color: Color.fromARGB(255, 255, 196, 0),
          child: Column(
            children: [
              Container(
                width: 137,
                height: 104,
                color: Colors.white,
                child: Image.network(
                  '',
                  width: 137,
                  height: 104,
                ),
              ),
            ],
          ),
        ));
  }
}
