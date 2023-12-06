import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen(
      {super.key, required this.finalPrice, required this.reset});

  final Function() reset;
  final String finalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFF725E), // start color
                  Color(0xFFFAAE7B), // end color
                ],
              ),
            ),
          ),
          Positioned(
            top: 30.0,
            left: (MediaQuery.of(context).size.width - 294.0) / 2,
            child: Container(
              width: 294.0,
              height: 442.0,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.black,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Successful Transaction',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 300.0,
                    height: 100.0,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF725E),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Payment Method : Cash',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          height: 20,
                        ),
                        Text(
                          'Money Changes : Rp$finalPrice',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.0),
                  Text(
                    'Send Receipt',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFFFF725E),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5.0,
            left: (MediaQuery.of(context).size.width - 315.0) / 2,
            child: Container(
              width: 315.0,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement print receipt functionality
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fixedSize: Size(294.0, 61.0),
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    child: Text(
                      'Print Receipt',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      reset();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    child: Container(
                      width: 294.0,
                      height: 61.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'Next Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
