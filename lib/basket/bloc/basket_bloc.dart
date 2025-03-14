import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop/repository/product_model.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    on<AddToBasket>((event, emit) {
      final updatedItems = List<ProductModel>.from(state.items)
        ..add(event.products);
      emit(BasketState(items: updatedItems));
    });

    on<RemoveFromBasket>((event, emit) {
      final updatedItems = List<ProductModel>.from(state.items)
        ..remove(event.products);
      emit(BasketState(items: updatedItems));
    });
  }
}
