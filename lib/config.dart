import 'package:flutter_dotenv/flutter_dotenv.dart';

String rootEndpoint = dotenv.get('API_ROOT_ENDPOINT');

class Config {
  static String menuEndpoint = "$rootEndpoint/menu";
  static String orderEndpoint = "$rootEndpoint/orders";
}
