import 'package:flutter/services.dart';

class CardDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll('/', '');

    if (text.length > 4) return oldValue;

    String formatted = "";
    if (text.length >= 2) {
      formatted = "${text.substring(0, 2)}/${text.substring(2)}";
    } else {
      formatted = text;
    }

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
