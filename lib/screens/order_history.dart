import 'package:cashier/models/order.dart';
import 'package:cashier/services/api_service.dart';
import 'package:cashier/utils/color.dart';
import 'package:cashier/utils/regex.dart';
import 'package:cashier/widgets/header.dart';
import 'package:cashier/widgets/order_history_summary.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Screen',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const OrderScreen(),
    );
  }
}

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreen();
}

class _OrderScreen extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _selectedIndex = 1; // Set index to 1 for 'Orders'

  final List<Map<String, dynamic>> orders = List.generate(
    20, // Generate 20 orders for the example
    (index) => {
      'orderId': '#${44440000 + index}',
      'date': '22/11/2023',
      'totalSales': 'Rp. 35.000',
    },
  );

  List<Widget> _buildOrderPages() {
    List<Widget> pages = [];
    for (int i = 0; i < orders.length; i += 10) {
      pages.add(buildOrderList(
          orders.sublist(i, i + 10 > orders.length ? orders.length : i + 10)));
    }
    return pages;
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFFFF725E) : Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  Widget buildOrderList(List<Map<String, dynamic>> pageOrders) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (context, index) => Divider(
          color: const Color.fromARGB(255, 207, 207, 207),
          thickness: 0,
          height: 1),
      itemBuilder: (context, index) {
        return Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          color: Colors.white,
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pageOrders[index]['orderId'],
                  style: TextStyle(color: Color(0xFF18273F)),
                ),
                Text(
                  pageOrders[index]['date'],
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  pageOrders[index]['totalSales'],
                  style: TextStyle(color: Color(0xFF18273F)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    List<Widget> orderPages = _buildOrderPages();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 207, 207),
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        Stack(children: [
          Container(
            width: 412,
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFF18273F),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(21, 30, 0, 0),
              child: Text(
                'Orders',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.00, 1.00),
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 82, 0, 0),
                child: Container(
                    width: 348,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: TextFormField(
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Search',
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFB0B0B0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.00, 0.00),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF725E),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 23,
                            ),
                            color: Colors.white,
                            iconSize: 23,
                            onPressed: () {},
                            tooltip: 'Start Searching',
                          ),
                        ),
                      ),
                    ]))),
          )
        ]),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Container(
              margin: EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
              width: 348,
              height: 410,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 207, 207),
                borderRadius: BorderRadius.circular(8),
              ),
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: orderPages,
              )),
        ),
        Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10), // Adjust the bottom padding as needed
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < orderPages.length; i++)
                        i == _currentPage
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 5), // Padding for navigation arrows
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF18273F),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFFFF725E),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}

class OrderHistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderHistoryScreenState();
}

class OrderHistoryScreenState extends State<OrderHistoryScreen> {
  PaginationMeta _paginationMeta = PaginationMeta(
      currentPage: 1,
      itemCount: 10,
      itemsPerPage: 1,
      totalPages: 2,
      totalItems: 10);
  List<Order> _currentPage = [];
  late Future<List<Order>> _ordersFuture;
  bool isThisLastPage = true;
  bool isThisFirstPage = true;

  void setIsThisLastPage() {
    isThisLastPage = _paginationMeta.currentPage == _paginationMeta.totalPages;
  }

  void setIsThisFirstPage() {
    isThisFirstPage = _paginationMeta.currentPage == 1;
  }

  void nextPage() {
    setState(() {
      _paginationMeta.currentPage++;
      _ordersFuture = getOrders(); // Reset the future to fetch new data
    });
  }

  void previousPage() {
    setState(() {
      _paginationMeta.currentPage--;
      _ordersFuture = getOrders(); // Reset the future to fetch new data
    });
  }

  Future<List<Order>> getOrders() async {
    try {
      PaginateOrder result =
          await APIService.getOrderList(_paginationMeta.currentPage);
      _paginationMeta = result.meta;
      _currentPage = result.items;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          setIsThisFirstPage();
          setIsThisLastPage();
        });
      });

      return result.items;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    _ordersFuture = getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(
            text: Text(
          "Orders",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        )),
        Container(
          height: MediaQuery.sizeOf(context).height - 160,
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              const Card(
                color: primaryColor,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Id',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Text(
                        'Date',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Text(
                        "Total Price",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: FutureBuilder(
                  future: _ordersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: _currentPage.length,
                        itemBuilder: (BuildContext context, int index) {
                          Order curr = _currentPage[index];
                          String id = curr.id!.split('-')[0];
                          String date = formatDate(curr.orderAt!);
                          String totalPrice = formatAmount(curr.totalPrice);
                          return OrderHistorySummary(
                              id: id, date: date, totalPrice: totalPrice);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text('Error reading database'));
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: secondaryColor,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: isThisFirstPage ? null : previousPage,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: isThisLastPage ? null : nextPage,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
