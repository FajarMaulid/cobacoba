<<<<<<< HEAD
<<<<<<< HEAD
import 'package:cashier/screens/menu_screen.dart';
=======
import 'package:cashier/screens/main_screen.dart';
>>>>>>> 09e088b (feat: implement navbar functionality)
import 'package:cashier/utils/color.dart';
=======
import 'package:cashier/transaction_successful.dart';
>>>>>>> e126cc4 (Sena menambahkan Screen Transaction Successful)
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(height: 15), // For spacing
              Image.asset('assets/images/welcome_image.png'),
              const Text(
                'Welcome To',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
<<<<<<< HEAD
              const Text(
                'CashHere',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: primaryColor,
=======
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xffFF725E),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
>>>>>>> e126cc4 (Sena menambahkan Screen Transaction Successful)
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text('Get Started'),
                ),
              ),
              const SizedBox(height: 20), // For spacing
            ],
          ),
        ),
      ),
    );
  }
}
