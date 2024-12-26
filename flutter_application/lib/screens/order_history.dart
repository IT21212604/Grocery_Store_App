// import 'package:flutter/material.dart';

// class OrdersHistoryPage extends StatelessWidget {
//   const OrdersHistoryPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Orders'),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.brown,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.brown),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Column(
//         children: [
//           // Tabs for Ongoing and History
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(context, '/ordersOngoing');
//                   },
//                   child: Text(
//                     'Ongoing',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey.shade500,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Stay on the current page
//                   },
//                   child: const Text(
//                     'History',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.brown,
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(color: Colors.grey),

//           // Orders List
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16.0),
//               children: const [
//                 OrderCard(
//                   orderNumber: "#345",
//                   status: "Delivered",
//                   date: "October 26, 2014",
//                   price: "\$700",
//                   statusColor: Colors.green,
//                 ),
//                 OrderCard(
//                   orderNumber: "#346",
//                   status: "Cancelled",
//                   date: "October 14, 2016",
//                   price: "\$452",
//                   statusColor: Colors.red,
//                 ),
//                 OrderCard(
//                   orderNumber: "#347",
//                   status: "Delivered",
//                   date: "July 26, 2017",
//                   price: "\$281",
//                   statusColor: Colors.green,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


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

class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String status;
  final String date;
  final String price;
  final Color statusColor;

  const OrderCard({
    Key? key,
    required this.orderNumber,
    required this.status,
    required this.date,
    required this.price,
    required this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderNumber,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 14,
                    color: statusColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
