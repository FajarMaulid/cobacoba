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
            CategoryItem(
                selectedCategory: widget.selectedCategory,
                imagePath: 'assets/images/starter-category.png',
                setSelectedCategory: widget.setSelectedCategory,
                chosenCategory: MenuCategory.starter,
                title: "Starter"),
            CategoryItem(
              selectedCategory: widget.selectedCategory,
              imagePath: 'assets/images/main-course-category.png',
              setSelectedCategory: widget.setSelectedCategory,
              chosenCategory: MenuCategory.mainCourse,
              title: "Main Course",
            ),
            CategoryItem(
              selectedCategory: widget.selectedCategory,
              imagePath: 'assets/images/side-dish-category.png',
              setSelectedCategory: widget.setSelectedCategory,
              chosenCategory: MenuCategory.sideDish,
              title: "Side Dish",
            ),
            CategoryItem(
              selectedCategory: widget.selectedCategory,
              imagePath: 'assets/images/dessert-category.png',
              setSelectedCategory: widget.setSelectedCategory,
              chosenCategory: MenuCategory.dessert,
              title: "Dessert",
            ),
            CategoryItem(
              selectedCategory: widget.selectedCategory,
              imagePath: 'assets/images/beverages-category.png',
              setSelectedCategory: widget.setSelectedCategory,
              chosenCategory: MenuCategory.beverage,
              title: "Beverage",
            ),
          ]),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.selectedCategory,
      required this.setSelectedCategory,
      required this.chosenCategory,
      required this.imagePath,
      required this.title});

  final String title;
  final String imagePath;
  final MenuCategory selectedCategory;
  final MenuCategory chosenCategory;
  final Function(MenuCategory) setSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: (selectedCategory == chosenCategory)
            ? const EdgeInsets.only(left: 5, top: 8, right: 5, bottom: 1)
            : const EdgeInsets.only(bottom: 1),
        decoration: (selectedCategory == chosenCategory)
            ? const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5)))
            : const BoxDecoration(),
        child: Column(
          children: [
            Image.asset(imagePath),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 1),
                height: 25,
                width: 50,
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0,
                        wordSpacing: 1,
                        height: 1,
                        color: (selectedCategory == chosenCategory)
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setSelectedCategory(chosenCategory);
      },
    );
  }
}
