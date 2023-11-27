import 'package:cashier/config.dart';
import 'package:cashier/models/menu.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<List<Menu>> getMenuByCategory(MenuCategory category) async {
    final query = {'category': category.value};
    var url = Uri.http(dotenv.get('API_URL'), Config.menuEndpoint, query);

    var response = await client.get(url);

    var menus = listMenuResponseModel(response.body);
    return menus;
  }
}
