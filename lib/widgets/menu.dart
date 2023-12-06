import 'package:cashier/models/menu.dart';
import 'package:cashier/utils/color.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.menu,
    required this.addMenu,
    required this.removeMenu,
    required this.currentAmount,
    required this.price,
  });

  final Menu menu;
  final Function(Menu) addMenu;
  final Function(Menu) removeMenu;
  final int currentAmount;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(2.5),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(children: [
              Expanded(
                  flex: 3,
                  child: Center(
                      child: Text(
                    menu.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ))),
              Expanded(flex: 1, child: Center(child: Text("Rp$price"))),
            ]),
          ),
          Expanded(
            flex: 1,
            child: (currentAmount <= 0)
                ? AddMenuButton(addMenu: addMenu, menu: menu)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        SizedBox(
                          height: 24,
                          child: Card(
                            elevation: 5,
                            margin: const EdgeInsets.all(0),
                            color: primaryColor,
                            shape: const CircleBorder(),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  removeMenu(menu);
                                },
                                icon: const Icon(
                                  Icons.remove,
                                ),
                                iconSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text("$currentAmount"),
                        SizedBox(
                          height: 24,
                          child: Card(
                            elevation: 5,
                            margin: const EdgeInsets.all(0),
                            color: primaryColor,
                            shape: CircleBorder(),
                            child: IconButton(
                              onPressed: () {
                                addMenu(menu);
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                              iconSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]),
          )
        ],
      ),
    );
  }
}

class AddMenuButton extends StatelessWidget {
  const AddMenuButton({
    super.key,
    required this.addMenu,
    required this.menu,
  });
  final Function(Menu) addMenu;
  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        addMenu(menu);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
        margin: const EdgeInsets.all(2),
        color: primaryColor,
        child: const Center(
            child: Text("ADD",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white))),
      ),
    );
  }
}
