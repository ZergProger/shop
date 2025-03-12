import 'package:dio/dio.dart';
import 'package:shop/repository/abstract_repository.dart';
import 'package:shop/repository/product_model.dart';

class ShopRepository implements AbstractProductRepository {
  ShopRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<ProductModel>> fetchData() async {
    Response response = await dio.get('https://fakestoreapi.com/products');

    final data = response.data as List<dynamic>;

    final products = data.map((e) {
      return ProductModel(
        id: e['id'],
        title: e['title'],
        price: e['price'],
        description: e['description'],
        category: e['category'],
        image: e['image'],
        rate: e['rate'],
        rateCount: e['rateCount'],
      );
    }).toList();

    if (response.statusCode == 200) {
      return products;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
