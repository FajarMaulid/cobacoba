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
  });

  final Menu menu;
  final Function(Menu) addMenu;
  final Function(Menu) removeMenu;
  final int currentAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
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
                  ))),
              Expanded(flex: 1, child: Center(child: Text("Rp${menu.price}"))),
            ]),
          ),
          Expanded(
            flex: 1,
            child: (currentAmount <= 0)
                ? AddMenuButton(addMenu: addMenu, menu: menu)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Container(
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                removeMenu(menu);
                              },
                              icon: const Icon(
                                Icons.remove,
                              ),
                              iconSize: 11,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text("$currentAmount"),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: IconButton(
                            onPressed: () {
                              addMenu(menu);
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                            iconSize: 11,
                            color: Colors.white,
                          ),
                        ),
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
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            )),
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
