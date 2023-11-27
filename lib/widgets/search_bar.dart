import 'package:cashier/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Row(children: [
        const SizedBox(
          width: 20,
        ),
        const Expanded(
          flex: 7,
          child: Text(
            'Search',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(
              Iconsax.search_normal_1_copy,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
