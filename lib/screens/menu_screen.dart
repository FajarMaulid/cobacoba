import 'package:cashier/models/menu.dart';
import 'package:cashier/services/api_service.dart';
import 'package:cashier/utils/color.dart';
import 'package:cashier/widgets/added_menu_price.dart';
import 'package:cashier/widgets/categories.dart';
import 'package:cashier/widgets/checkout_popup.dart';
import 'package:cashier/widgets/header.dart';
import 'package:cashier/widgets/menu.dart';
import 'package:cashier/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = '/menu-screen';

  const MenuScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MenuCategory _selectedCategory = MenuCategory.starter;
  List<Menu> _menus = [];
  final Map<String, int> _addedMenu = <String, int>{};
  final Set<Menu> _addedMenus = {};
  String totalPrice = "";
  int totalItem = 0;
  int _selectedNav = 0;
  bool _isDoneChoosing = false;

  void onNavbarTapped(int index) {
    setState(() {
      _selectedNav = index;
    });
  }

  void toggleChoosingStatus({bool? value}) {
    setState(() {
      if (value != null) {
        _isDoneChoosing = value;
      } else {
        _isDoneChoosing = (_isDoneChoosing) ? false : true;
      }
    });
  }

  void getTotalItem() {
    int total = 0;
    _addedMenu.forEach((key, value) {
      total += value;
    });
    totalItem = total;
  }

  void getTotalPrice() {
    double total = 0;
    _addedMenu.forEach((key, value) {
      total +=
          _addedMenus.firstWhere((element) => element.id == key).price * value;
    });
    totalPrice = total.toStringAsFixed(2);
  }

  void addMenu(Menu menu) {
    setState(() {
      if (_addedMenu[menu.id] == null || _addedMenu[menu.id] == 0) {
        _addedMenu[menu.id] = 1;
        _addedMenus.add(menu);
      } else {
        _addedMenu[menu.id] = _addedMenu[menu.id]! + 1;
      }
      getTotalItem();
      getTotalPrice();
    });
  }

  void removeMenu(Menu menu) {
    setState(() {
      _addedMenu[menu.id] = _addedMenu[menu.id]! - 1;
      if (_addedMenu[menu.id] == 0) {
        _addedMenus.removeWhere((item) => item.id == menu.id);
        _addedMenu.remove(menu.id);
      }
      getTotalItem();
      getTotalPrice();
    });
  }

  void setSelectedCategory(MenuCategory newValue) {
    setState(() {
      _selectedCategory = newValue;
    });
  }

  Future<List<Menu>> getMenus() async {
    try {
      List<Menu> result = await APIService.getMenuByCategory(_selectedCategory);
      _menus = result;
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    // getProducts(MenuCategory.starter);

    return Scaffold(
      backgroundColor: const Color(0xffcfcfcf),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
              text: Text(
                "Menu",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              widget: CustomSearchBar()),
          Stack(children: [
            Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesWidget(
                      selectedCategory: _selectedCategory,
                      setSelectedCategory: setSelectedCategory,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height - 342,
                        child: Stack(
                          children: [
                            Scrollbar(
                                child: SingleChildScrollView(
                                    child: FutureBuilder(
                                        future: getMenus(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return GridView.builder(
                                              padding: const EdgeInsets.only(
                                                  bottom: 60),
                                              shrinkWrap: true,
                                              physics: const ScrollPhysics(),
                                              itemCount: _menus.length,
                                              itemBuilder: (context, index) {
                                                Menu menu = _menus[index];
                                                int currentAmount =
                                                    _addedMenu[menu.id] ?? 0;
                                                return MenuWidget(
                                                  menu: menu,
                                                  addMenu: addMenu,
                                                  removeMenu: removeMenu,
                                                  currentAmount: currentAmount,
                                                );
                                              },
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      mainAxisExtent: 130,
                                                      crossAxisCount: 3),
                                            );
                                          } else if (snapshot.hasError) {
                                            return const Center(
                                                child: Text(
                                                    'Error reading database'));
                                          }
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              color: secondaryColor,
                                            ),
                                          );
                                        }))),
                            Container(),
                            _addedMenus.isNotEmpty
                                ? AddedMenuPrice(
                                    totalItem: totalItem,
                                    totalPrice: totalPrice,
                                    callback: toggleChoosingStatus)
                                : Container()
                          ],
                        ))
                  ],
                )),
            (_isDoneChoosing)
                ? CheckoutPopup(
                    toggleChoosingStatus: toggleChoosingStatus,
                    addedMenu: _addedMenu,
                    addedMenus: _addedMenus)
                : Container()
          ]),
        ],
      ),
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
    );
  }
}
