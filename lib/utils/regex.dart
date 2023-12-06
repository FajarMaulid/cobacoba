import 'package:intl/intl.dart';

String formatAmount(double amount) {
  final formatter = NumberFormat("#,##0", "en_US");
  return formatter.format(amount);
}

int parseFormattedAmount(String formattedAmount) {
  final cleanString = formattedAmount.replaceAll(',', '');

  final parsedAmount = int.tryParse(cleanString);

  if (parsedAmount != null) {
    return parsedAmount;
  } else {
    throw const FormatException('Invalid formatted amount');
  }
}
