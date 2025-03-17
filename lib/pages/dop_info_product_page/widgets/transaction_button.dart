import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/history/bloc/history_bloc.dart';
import 'package:shop/repository/models/product_model.dart';

class TransactionButton extends StatelessWidget {
  const TransactionButton({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
        context.read<HistoryBloc>().add(AddToHistory(products));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD8A500),
        minimumSize: const Size(300, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: const Text(
        'Buy',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
