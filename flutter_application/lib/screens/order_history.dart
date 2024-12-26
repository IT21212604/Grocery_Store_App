import 'package:flutter/material.dart';

class OrdersHistoryPage extends StatelessWidget {
  const OrdersHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Tabs for Ongoing and History
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/ordersOngoing');
                  },
                  child: Text(
                    'Ongoing',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Stay on the current page
                  },
                  child: const Text(
                    'History',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),

          // Orders List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                OrderCard(
                  orderNumber: "#345",
                  status: "Delivered",
                  date: "October 26, 2014",
                  price: "\$700",
                  statusColor: Colors.green,
                ),
                OrderCard(
                  orderNumber: "#346",
                  status: "Cancelled",
                  date: "October 14, 2016",
                  price: "\$452",
                  statusColor: Colors.red,
                ),
                OrderCard(
                  orderNumber: "#347",
                  status: "Delivered",
                  date: "July 26, 2017",
                  price: "\$281",
                  statusColor: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
