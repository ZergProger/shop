import 'package:dio/dio.dart';
import 'package:shop/repository/product_model.dart';

class ShopRepository {
  ShopRepository({required this.dio});

  final Dio dio;

  Future<List<ProductModel>> getData() async {
    final response = await dio.get('https://fakestoreapi.com/products');

    // API возвращает список, приводим к List<dynamic>
    final List<dynamic> dataList = response.data as List<dynamic>;

    // Преобразуем список JSON-объектов в список `ProductModel`
    return dataList.map((json) => ProductModel.fromJson(json)).toList();
  }
}
