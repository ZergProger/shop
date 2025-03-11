import 'package:flutter_test/flutter_test.dart';
import 'package:shop/repository/product_model.dart';

void main() {
  test('fromJson() корректно парсит JSON', () {
    final json = {
      "id": 1,
      "title": "Test Product",
      "price": 9.99,
      "image": "https://example.com/image.jpg"
    };

    final product = ProductModel.fromJson(json);

    expect(product.id, 1);
    expect(product.title, "Test Product");
    expect(product.price, 9.99);
    expect(product.image, "https://example.com/image.jpg");
  });

  test('toJson() корректно сериализует объект', () {
    final product = ProductModel(
        id: 1,
        title: "Test Product",
        price: 9.99,
        image: "https://example.com/image.jpg",
        description: '',
        category: '');

    final json = product.toJson();

    expect(json['id'], 1);
    expect(json['title'], "Test Product");
    expect(json['price'], 9.99);
    expect(json['image'], "https://example.com/image.jpg");
  });
}
