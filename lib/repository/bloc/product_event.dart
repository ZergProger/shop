part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class ProductLoad extends ProductEvent {
  const ProductLoad({this.completer});

  final Completer? completer;
}
