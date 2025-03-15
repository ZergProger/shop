import 'package:flutter/material.dart';
import 'package:shop/repository/product_model.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 196, 27),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  product.image,
                  width: 90,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${product.price}\$',
                    style: const TextStyle(fontSize: 14, color: Colors.white),
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
