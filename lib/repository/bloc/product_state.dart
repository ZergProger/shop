part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState({this.productList = const []});

  final List<ProductModel> productList;

  @override
  List<Object> get props => [productList];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  const ProductLoaded({required this.products});

  final List<ProductModel> products;
}

final class ProductFailed extends ProductState {
  const ProductFailed({this.exception});

  final Object? exception;
}
