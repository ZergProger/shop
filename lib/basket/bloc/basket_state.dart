part of 'basket_bloc.dart';

class BasketState {
  final List<ProductModel> items;
  BasketState({required this.items});
}

class BasketInitial extends BasketState {
  BasketInitial() : super(items: []);
}
