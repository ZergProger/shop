import 'package:flutter/material.dart';
import 'package:shop/pages/dop_info_product_page/dop_info_products_page.dart';
import 'package:shop/repository/models/product_model.dart';

class BasketRecommendProduct extends StatefulWidget {
  const BasketRecommendProduct({super.key, required this.products});

  final ProductModel products;

  @override
  State<BasketRecommendProduct> createState() => _BasketRecommendProductState();
}

class _BasketRecommendProductState extends State<BasketRecommendProduct> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(widget.products),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DopInfoProductsPage(product: widget.products)),
      ),
      child: Padding(
          padding: EdgeInsets.only(right: 5, left: 5),
          child: Container(
            width: 140,
            height: 200,
            color: Color.fromARGB(255, 255, 196, 0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    width: 137,
                    height: 140,
                    color: Colors.white,
                    child: Image.network(
                      widget.products.image,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
