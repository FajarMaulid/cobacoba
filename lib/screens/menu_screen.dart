import 'package:cashier/models/menu.dart';
import 'package:cashier/services/api_service.dart';
import 'package:cashier/utils/color.dart';
import 'package:cashier/utils/regex.dart';
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
  final TextEditingController _searchTextController = TextEditingController();
  String searchValue = "";
  String totalPrice = "";
  int totalItem = 0;
  bool _isDoneChoosing = false;

  void handleTitleTextChange() {
    setState(() {
      searchValue = _searchTextController.text.trim();
    });
  }

  void reset() {
    setState(() {
      _addedMenu.clear();
      _addedMenus.clear();
      totalPrice = "";
      totalItem = 0;
      _isDoneChoosing = false;
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
    totalPrice = formatAmount(total);
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
      List<Menu> result =
          await APIService.getMenuByCategory(_selectedCategory, searchValue);
      _menus = result;
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    // getProducts(MenuCategory.starter);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Header(
                text: const Text(
                  "Menu",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                widget: CustomSearchBar(
                    searchTextController: _searchTextController,
                    search: handleTitleTextChange)),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 20,
            child: Stack(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: CategoriesWidget(
                          selectedCategory: _selectedCategory,
                          setSelectedCategory: setSelectedCategory,
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 18,
                        child: SizedBox(
                          child: Scrollbar(
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
                                              String price =
                                                  formatAmount(menu.price);
                                              return MenuWidget(
                                                  menu: menu,
                                                  addMenu: addMenu,
                                                  removeMenu: removeMenu,
                                                  currentAmount: currentAmount,
                                                  price: price);
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
                          //   Container(),
                          //   _addedMenus.isNotEmpty
                          //       ? AddedMenuPrice(
                          //           totalItem: totalItem,
                          //           totalPrice: totalPrice,
                          //           callback: toggleChoosingStatus)
                          //       : Container()
                          // ],
                        ),
                      )
                    ],
                  )),
              _addedMenus.isNotEmpty
                  ? AddedMenuPrice(
                      totalItem: totalItem,
                      totalPrice: totalPrice,
                      callback: toggleChoosingStatus)
                  : Container(),
              (_isDoneChoosing)
                  ? CheckoutPopup(
                      toggleChoosingStatus: toggleChoosingStatus,
                      finalPrice: totalPrice,
                      addedMenu: _addedMenu,
                      addedMenus: _addedMenus,
                      reset: reset)
                  : Container()
            ]),
          ),
        ],
      ),
    );
  }
}
