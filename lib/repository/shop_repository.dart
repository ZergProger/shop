import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:shop/repository/abstract_repository.dart';
import 'package:shop/repository/models/product_model.dart';

class ShopRepository implements AbstractProductRepository {
  ShopRepository({required this.productBox, required this.dio});

  final Dio dio;
  final Box<ProductModel> productBox;

  @override
  Future<List<ProductModel>> fetchData() async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');

      final data = response.data as List<dynamic>;

      final productsList = data.map((e) => ProductModel.fromJson(e)).toList();

      final productsMap = {for (var e in productsList) e.id: e};
      await productBox.putAll(productsMap);

      if (response.statusCode == 200) {
        return productsList;
      }
    } on DioException catch (dioError) {
      print('dio error');
      return productBox.values.toList();
    } catch (e) {
      print('Ошибка при получении данных: $e');
      return productBox.values.toList();
    }
    return [];
  }
}
