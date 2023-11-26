import 'dart:io';

import 'package:intl/intl.dart';

class Money {
  num amount;
  String currency = "";
  Money(this.amount, {bool includeShortName = true}) : currency = "USD";
  String get formatted {
    var symbol =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: currency)
            .currencySymbol;
    var currencyConverter = NumberFormat('#,##0', 'en_US').format(amount);
    return "$symbol$currencyConverter";
  }
}
