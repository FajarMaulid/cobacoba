import 'package:cashier/screens/main_screen.dart';
import 'package:cashier/services/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/welcome_screen.dart'; // Import the welcome screen

Widget _defaultHome = const WelcomeScreen();
void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();

  bool _isStarted = await SharedService.isStarted();
  if (_isStarted) {
    _defaultHome = MainScreen();
  }
  runApp(const ProviderScope(child: MyApp()));
}

final providerInitiaion = Provider<String>((_) => 'initialClass');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => _defaultHome,
    });
  }
}
