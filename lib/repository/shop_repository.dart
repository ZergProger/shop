import 'package:dio/dio.dart';
import 'package:shop/repository/abstract_repository.dart';
import 'package:shop/repository/product_model.dart';

class ShopRepository implements AbstractProductRepository {
  ShopRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<ProductModel>> fetchData() async {
    Response response = await dio.get('https://fakestoreapi.com/products');

    final List<dynamic> data = response.data;
    return data.map((data) => ProductModel.fromJson(data)).toList();
  }
}
