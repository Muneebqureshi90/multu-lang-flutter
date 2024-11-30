import 'package:flutter/material.dart';

class CurrencyModel extends ChangeNotifier {
  String _selectedCurrency = 'USD';

  String get selectedCurrency => _selectedCurrency;

  void setCurrency(String currency) {
    _selectedCurrency = currency;
    notifyListeners();
  }
}
