import 'package:intl/intl.dart';

class CurrencyFormatter {
  /// Formats a given amount based on the selected currency and locale.
  /// [amount]: The numeric value to format.
  /// [currencyCode]: The ISO 4217 currency code (e.g., 'USD', 'EUR', 'GBP').
  /// [locale]: The locale string (e.g., 'en_US', 'fr_FR').
  static String format(double amount, String currencyCode, String locale) {
    try {
      final format = NumberFormat.simpleCurrency(
        locale: locale,
        name: currencyCode,
      );
      return format.format(amount);
    } catch (e) {
      // Fallback in case of an error
      return '$currencyCode $amount';
    }
  }
}
