import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedService {
  static Future<void> getStarted() async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: 'is_started', value: 'y');
  }

  static Future<bool> isStarted() async {
    const secureStorage = FlutterSecureStorage();
    var data = await secureStorage.read(key: 'is_started');

    return (data != null) ? true : false;
  }
}
