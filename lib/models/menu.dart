import 'dart:convert';

enum MenuCategory {
  starter('STARTER'),
  mainCourse('MAIN-COURSE'),
  sideDish('SIDE-DISH'),
  dessert('DESSERT'),
  beverage('BEVERAGE');

  final String value;
  const MenuCategory(this.value);
}

Menu menuResponseModel(String str) => Menu.fromJson(json.decode(str));

class Menu {
  final String id;
  final String name;
  final String? description;
  final MenuCategory? category;
  final double price;
  final int stock;
  final String? image;
  final DateTime? createdAt;
  final DateTime? modifiedAt;

  Menu(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.stock,
      required this.image,
      required this.createdAt,
      required this.modifiedAt});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        category: json['category'],
        price: json['price'].toDouble(),
        stock: json['stock'],
        image: json['image'],
        createdAt: json['createdAt'],
        modifiedAt: json['modifiedAt']);
  }
}

PaginateMenu paginateMenuResponseModel(String str) =>
    PaginateMenu.fromJson(json.decode(str));

class PaginateMenu {
  final List<Menu> items;

  PaginateMenu({required this.items});

  factory PaginateMenu.fromJson(Map<String, dynamic> json) {
    return PaginateMenu(
        items: List.from(json['items']).map((e) => Menu.fromJson(e)).toList());
  }
}
