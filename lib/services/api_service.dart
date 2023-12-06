import 'dart:convert';

import 'package:cashier/config.dart';
import 'package:cashier/models/menu.dart';
import 'package:cashier/models/order.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<List<Menu>> getMenuByCategory(
      MenuCategory category, String? search) async {
    final query = {'category': category.value};
    if (search != null) {
      query['search'] = search;
    }

    var url = Uri.http(dotenv.get('API_URL'), Config.menuEndpoint, query);

    var response = await client.get(url);

    var menus = listMenuResponseModel(response.body);
    return menus;
  }

  static Future<String> postOrder(Order order) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(dotenv.get('API_URL'), Config.orderEndpoint);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(order.toJson()));

    return response.body;
  }
}
