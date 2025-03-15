part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

final class AddToHistory extends HistoryEvent {
  final ProductModel product;

  const AddToHistory(this.product);

  @override
  List<Object> get props => [product];
}

final class RemoveFromHistory extends HistoryEvent {
  final ProductModel product;

  const RemoveFromHistory(this.product);

  @override
  List<Object> get props => [product];
}
