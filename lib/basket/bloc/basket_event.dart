part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class AddToBasket extends BasketEvent {
  final ProductModel products;
  const AddToBasket(this.products);
}

class RemoveFromBasket extends BasketEvent {
  final ProductModel products;
  const RemoveFromBasket(this.products);
}
