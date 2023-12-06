import 'dart:convert';

import 'package:cashier/models/menu.dart';

class OrderMenu {
  final int quantity;
  final Menu menu;

  OrderMenu({
    required this.menu,
    required this.quantity,
  });

  factory OrderMenu.fromJson(Map<String, dynamic> json) {
    return OrderMenu(
      menu: Menu.fromJson(json['menu']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menu': menu.toJson(),
      'quantity': quantity,
    };
  }
}

Order orderResponseModel(String str) => Order.fromJson(json.decode(str));
List<Order> listOrderResponseModel(String str) {
  var jsonList = json.decode(str) as List;
  return jsonList.map((jsonItem) => Order.fromJson(jsonItem)).toList();
}

class Order {
  final String? id;
  final String recipientName;
  final int totalPrice;
  final List<OrderMenu>? menus;
  final DateTime? orderAt;

  Order({
    this.id,
    required this.recipientName,
    required this.totalPrice,
    this.menus,
    this.orderAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      recipientName: json['recipientName'],
      totalPrice: json['totalPrice'] * 2000,
      menus: (json['menus'] as List<dynamic>?)
          ?.map((menuJson) => OrderMenu.fromJson(menuJson))
          .toList(),
      orderAt: DateTime.parse(json['orderAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipientName': recipientName,
      'totalPrice': totalPrice / 2000,
      'menus': menus?.map((menu) => menu.toJson()).toList(),
    };
  }
}
