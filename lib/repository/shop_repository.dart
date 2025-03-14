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

    if (response.statusCode == 200) {
      return data.map((e) {
        return ProductModel(
          id: e['id'],
          title: e['title'] as String,
          price: e['price'],
          description: e['description'] as String,
          category: e['category'] as String,
          image: e['image'] as String,
        );
      }).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
