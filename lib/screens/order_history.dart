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
