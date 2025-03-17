import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop/repository/models/product_model.dart';
import 'package:shop/repository/shop_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.productsRepository) : super(ProductLoading()) {
    on<ProductLoad>(_load);
  }

  final ShopRepository productsRepository;

  Future<void> _load(ProductLoad event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final products = await productsRepository.fetchData();

      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductFailed(exception: e));
      print('error $e');
    }
  }
}
