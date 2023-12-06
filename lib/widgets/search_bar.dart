import 'package:cashier/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, required this.searchTextController, required this.search});
  final TextEditingController searchTextController;
  final Function() search;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Row(children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 7,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: TextField(
                cursorColor: primaryColor,
                onSubmitted: (value) {
                  search();
                },
                controller: searchTextController,
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  decorationThickness: 0,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 7),
                  counter: null,
                  counterText: "",
                  hintText: 'Search',
                  hintStyle:
                      TextStyle(fontSize: 17, height: 2, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: primaryColor,
                child: IconButton(
                  icon: const Icon(
                    Iconsax.search_normal_1_copy,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    search();
                  },
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
