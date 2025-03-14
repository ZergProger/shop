import 'package:flutter/material.dart';

class TransactionButton extends StatelessWidget {
  const TransactionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
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
