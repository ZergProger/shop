part of 'history_bloc.dart';

final class HistoryState extends Equatable {
  final List<ProductModel> product;

  const HistoryState({required this.product});

  @override
  List<Object> get props => [product];
}

final class HistoryInitial extends HistoryState {
  HistoryInitial() : super(product: []);
}
