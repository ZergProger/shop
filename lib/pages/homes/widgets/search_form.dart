import 'package:flutter/material.dart';

class SearchForm extends StatelessWidget {
  SearchForm({super.key});

  final TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 294,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: TextField(
          controller: controllerSearch,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelText: '                    Search product',
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            hintText: '',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
