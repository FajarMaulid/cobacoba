import 'package:cashier/utils/color.dart';
import 'package:flutter/material.dart';

class AddedMenuPrice extends StatelessWidget {
  const AddedMenuPrice({
    super.key,
    required this.totalItem,
    required this.totalPrice,
    required this.callback,
  });

  final int totalItem;
  final String totalPrice;
  final Function({bool value}) callback;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 6,
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Ink(
          height: 60,
          width: double.infinity,
          child: Card(
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: secondaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$totalItem items",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Rp$totalPrice",
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
