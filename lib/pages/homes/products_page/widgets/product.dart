import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/basket/bloc/basket_bloc.dart';
import 'package:shop/pages/dop_info_product_page/dop_info_products_page.dart';
import 'package:shop/repository/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(products),
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DopInfoProductsPage(product: products);
        }));
      },
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 195, 39),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 71,
                  height: 71,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: products.image,
                    placeholder: (context, url) =>
                        Image.network(products.image),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.image_not_supported), // Ошибка
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  products.title,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 64,
                    height: 16,
                    child: Text(
                      '${products.price} \$',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 110, left: 105),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.8),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  context.read<BasketBloc>().add(AddToBasket(products));
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 22,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
