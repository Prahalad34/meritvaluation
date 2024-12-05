import 'package:flutter/services.dart';

class CardExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all non-digit characters
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Ensure the text is exactly 5 characters long (MM/YY)
    if (newText.length >= 3) {
      newText = '${newText.substring(0, 2)}/${newText.substring(2, 4)}';
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
