import 'package:cashier/models/menu.dart';
import 'package:cashier/utils/color.dart';
import 'package:flutter/material.dart';

class CheckoutPopup extends StatefulWidget {
  const CheckoutPopup(
      {super.key,
      required this.toggleChoosingStatus,
      required this.addedMenu,
      required this.addedMenus});

  final Function({bool value}) toggleChoosingStatus;
  final Map<String, int> addedMenu;
  final Set<Menu> addedMenus;

  @override
  State<StatefulWidget> createState() => _CheckoutPopupState();
}

class _CheckoutPopupState extends State<CheckoutPopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 65),
      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 15),
      height: MediaQuery.sizeOf(context).height / 1.8,
      width: double.infinity,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                30,
              ),
              topRight: Radius.circular(30))),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    widget.toggleChoosingStatus(value: false);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(children: [
              const Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(Icons.person_2_outlined),
                    SizedBox(
                      width: 2,
                    ),
                    Text("Mr. Jamal")
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      const Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Item",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                "Qty",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListView.builder(
                              padding: const EdgeInsets.only(bottom: 10),
                              itemCount: widget.addedMenus.length,
                              itemBuilder: (context, int index) {
                                List<Menu> menulist =
                                    widget.addedMenus.toList();
                                Menu currentMenu = menulist[index];
                                String menuName = currentMenu.name;
                                String? menuQuantity =
                                    widget.addedMenu[currentMenu.id].toString();

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(menuName),
                                      Text(menuQuantity)
                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(left: 75, right: 75),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: const Center(
                        child: Text('Check Out',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700))),
                  ))
            ]),
          ),
        )
      ]),
    );
    // TODO: implement build
  }
}
