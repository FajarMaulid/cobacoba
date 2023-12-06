import 'package:flutter/material.dart';

class OrderHistorySummary extends StatelessWidget {
  const OrderHistorySummary({
    super.key,
    required this.id,
    required this.date,
    required this.totalPrice,
  });

  final String id;
  final String date;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      color: Colors.white,
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '#$id',
              style: const TextStyle(color: Color(0xFF18273F)),
            ),
            Text(
              date,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              "Rp$totalPrice",
              style: const TextStyle(color: Color(0xFF18273F)),
            ),
          ],
        ),
      ),
    );
  }
}
