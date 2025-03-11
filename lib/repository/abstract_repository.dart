import 'package:shop/repository/product_model.dart';

abstract class AbstractProductRepository {
  Future<List<ProductModel>> fetchData();
}
