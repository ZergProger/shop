import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shop/repository/bloc/product_bloc.dart';
import 'package:shop/repository/product_model.dart';
import 'package:shop/repository/shop_repository.dart';

class MockShopRepository extends Mock implements ShopRepository {}

void main() {
  late MockShopRepository mockRepository;
  late ProductBloc productBloc;

  setUp(() {
    mockRepository = MockShopRepository();
    productBloc = ProductBloc(mockRepository);
  });

  tearDown(() {
    productBloc.close();
  });

  test('Начальное состояние ProductBloc - ProductLoading', () {
    expect(productBloc.state, ProductLoading());
  });

  blocTest<ProductBloc, ProductState>(
    'ProductBloc загружает продукты и переходит в ProductLoaded',
    build: () {
      when(() => mockRepository.fetchData()).thenAnswer(
        (_) async => [
          ProductModel(
              id: 1,
              title: "name",
              price: 9.99,
              image: "https://example.com/image.jpg",
              description: 'decryption',
              category: 'category')
        ],
      );
      return productBloc;
    },
    act: (bloc) => bloc.add(ProductLoad()),
    expect: () => [
      ProductLoading(),
      isA<ProductLoaded>()
          .having((state) => state.productList.length, 'list length', 1),
    ],
  );

  blocTest<ProductBloc, ProductState>(
    'ProductBloc выбрасывает ошибку при неудачном запросе',
    build: () {
      when(() => mockRepository.fetchData())
          .thenThrow(Exception('Ошибка загрузки'));
      return productBloc;
    },
    act: (bloc) => bloc.add(ProductLoad()),
    expect: () => [ProductLoading(), ProductFailed()],
  );
}
