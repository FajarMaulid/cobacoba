import 'package:cashier/models/menu.dart';
import 'package:cashier/utils/color.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  final MenuCategory selectedCategory;
  final Function(MenuCategory) setSelectedCategory;

  const CategoriesWidget(
      {super.key,
      required this.selectedCategory,
      required this.setSelectedCategory});

  @override
  State<StatefulWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              child: Container(
                padding: (widget.selectedCategory == MenuCategory.starter)
                    ? const EdgeInsets.all(5)
                    : const EdgeInsets.all(5),
                decoration: (widget.selectedCategory == MenuCategory.starter)
                    ? const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(5)))
                    : const BoxDecoration(),
                child: Column(
                  children: [
                    Image.asset('assets/images/starter-category.png'),
                    Text(
                      "Starters",
                      style: TextStyle(
                          fontSize: 12,
                          color:
                              (widget.selectedCategory == MenuCategory.starter)
                                  ? Colors.white
                                  : Colors.black),
                    ),
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  widget.setSelectedCategory(MenuCategory.starter);
                });
              },
            ),
            GestureDetector(
              child: Container(
                padding: (widget.selectedCategory == MenuCategory.mainCourse)
                    ? const EdgeInsets.all(5)
                    : const EdgeInsets.all(0),
                decoration: (widget.selectedCategory == MenuCategory.mainCourse)
                    ? const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(5)))
                    : const BoxDecoration(),
                child: Column(
                  children: [
                    Image.asset('assets/images/main-course-category.png'),
                    Text(
                      "Main Course",
                      style: TextStyle(
                          fontSize: 12,
                          color: (widget.selectedCategory ==
                                  MenuCategory.mainCourse)
                              ? Colors.white
                              : Colors.black),
                    ),
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  widget.setSelectedCategory(MenuCategory.mainCourse);
                });
              },
            ),
            GestureDetector(
              child: Container(
                padding: (widget.selectedCategory == MenuCategory.sideDish)
                    ? const EdgeInsets.all(5)
                    : const EdgeInsets.all(0),
                decoration: (widget.selectedCategory == MenuCategory.sideDish)
                    ? const BoxDecoration(
                        color: Color(0xffFF725E),
                        borderRadius: BorderRadius.all(Radius.circular(5)))
                    : const BoxDecoration(),
                child: Column(
                  children: [
                    Image.asset('assets/images/side-dish-category.png'),
                    Text(
                      "Side Dish",
                      style: TextStyle(
                          fontSize: 12,
                          color:
                              (widget.selectedCategory == MenuCategory.sideDish)
                                  ? Colors.white
                                  : Colors.black),
                    ),
                  ],
                ),
              ),
              onTap: () {
                widget.setSelectedCategory(MenuCategory.sideDish);
              },
            ),
            GestureDetector(
              child: Container(
                padding: (widget.selectedCategory == MenuCategory.dessert)
                    ? const EdgeInsets.all(5)
                    : const EdgeInsets.all(0),
                decoration: (widget.selectedCategory == MenuCategory.dessert)
                    ? const BoxDecoration(
                        color: Color(0xffFF725E),
                        borderRadius: BorderRadius.all(Radius.circular(5)))
                    : const BoxDecoration(),
                child: Column(
                  children: [
                    Image.asset('assets/images/dessert-category.png'),
                    Text(
                      "Dessert",
                      style: TextStyle(
                          fontSize: 12,
                          color:
                              (widget.selectedCategory == MenuCategory.dessert)
                                  ? Colors.white
                                  : Colors.black),
                    ),
                  ],
                ),
              ),
              onTap: () {
                widget.setSelectedCategory(MenuCategory.dessert);
              },
            ),
            GestureDetector(
              child: Container(
                padding: (widget.selectedCategory == MenuCategory.beverage)
                    ? const EdgeInsets.all(5)
                    : const EdgeInsets.all(0),
                decoration: (widget.selectedCategory == MenuCategory.beverage)
                    ? const BoxDecoration(
                        color: Color(0xffFF725E),
                        borderRadius: BorderRadius.all(Radius.circular(5)))
                    : const BoxDecoration(),
                child: Column(
                  children: [
                    Image.asset('assets/images/beverages-category.png'),
                    Text(
                      "Beverages",
                      style: TextStyle(
                          fontSize: 12,
                          color:
                              (widget.selectedCategory == MenuCategory.beverage)
                                  ? Colors.white
                                  : Colors.black),
                    ),
                  ],
                ),
              ),
              onTap: () {
                widget.setSelectedCategory(MenuCategory.beverage);
              },
            ),
          ]),
        ),
      ],
    );
  }
}
