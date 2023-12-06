import 'package:cashier/screens/menu_screen.dart';
import 'package:cashier/utils/color.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedNav = 0;

  void onNavbarTapped(int index) {
    setState(() {
      _selectedNav = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    MenuScreen(),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffcfcfcf),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              fixedColor: primaryColor,
              backgroundColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book), label: "Menu"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history), label: "History"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ],
              currentIndex: _selectedNav,
              onTap: onNavbarTapped,
            ),
          ),
        ),
        body: Center(
          child: _pages.elementAt(_selectedNav),
        ));
  }
}
