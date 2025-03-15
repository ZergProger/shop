import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/repository/product_model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    _loadBasket(); // Загружаем сохраненные продукты при создании блока

    on<RemoveFromHistory>(_onRemoveFromHistory);
    on<AddToHistory>(_onAddToHistory);
  }

  Future<void> _onRemoveFromHistory(
      RemoveFromHistory event, Emitter<HistoryState> emit) async {
    final updatedProducts = List<ProductModel>.from(state.product)
      ..remove(event.product);
    emit(HistoryState(product: updatedProducts));
    await _saveBasket(updatedProducts);
  }

  Future<void> _onAddToHistory(
      AddToHistory event, Emitter<HistoryState> emit) async {
    final updatedProducts = List<ProductModel>.from(state.product)
      ..add(event.product);
    emit(HistoryState(product: updatedProducts));
    await _saveBasket(updatedProducts);
  }

  Future<void> _saveBasket(List<ProductModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = items.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList('history_items', jsonList);
  }

  Future<void> _loadBasket() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('history_items') ?? [];
    final items =
        jsonList.map((e) => ProductModel.fromJson(jsonDecode(e))).toList();
    emit(HistoryState(product: items));
  }
}
