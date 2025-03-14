import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/repository/product_model.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    _loadBasket(); // Загружаем сохранённую корзину при запуске

    on<AddToBasket>((event, emit) async {
      final updatedItems = List<ProductModel>.from(state.items)
        ..add(event.products);
      emit(BasketState(items: updatedItems));
      await _saveBasket(updatedItems); // Сохраняем корзину
    });

    on<RemoveFromBasket>((event, emit) async {
      final updatedItems = List<ProductModel>.from(state.items)
        ..remove(event.products);
      emit(BasketState(items: updatedItems));
      await _saveBasket(updatedItems);
    });
  }

  Future<void> _saveBasket(List<ProductModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = items.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList('basket_items', jsonList);
  }

  Future<void> _loadBasket() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('basket_items') ?? [];
    final items =
        jsonList.map((e) => ProductModel.fromJson(jsonDecode(e))).toList();
    emit(BasketState(items: items));
  }
}
