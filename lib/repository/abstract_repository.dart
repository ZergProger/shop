import 'package:shop/repository/models/product_model.dart';

abstract class AbstractProductRepository {
  Future<List<ProductModel>> fetchData();
}
