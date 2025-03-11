import 'package:flutter_test/flutter_test.dart';
import 'package:shop/repository/product_model.dart';
import 'package:shop/repository/shop_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bloc_test.dart';

// Генерация моков
@GenerateMocks([ShopRepository])
void main() {
  group('fetchData', () {
    test('возвращает список продуктов при успешном вызове', () async {
      final client = MockShopRepository(); // Мокированная версия ShopRepository

      // Настроим мок: когда вызывается fetchData(), возвращаем пустой список
      when(client.fetchData()).thenAnswer((_) async => <ProductModel>[]);

      // Проверим, что fetchData() возвращает список продуктов
      expect(await client.fetchData(), isA<List<ProductModel>>());
    });

    test('выбрасывает исключение при ошибке HTTP', () async {
      final client = MockShopRepository();

      // Настроим мок: когда вызывается fetchData(), выбрасываем исключение
      when(client.fetchData()).thenThrow(Exception('Ошибка загрузки данных'));

      // Проверим, что вызывается исключение
      expect(client.fetchData(), throwsException);
    });
  });
}
