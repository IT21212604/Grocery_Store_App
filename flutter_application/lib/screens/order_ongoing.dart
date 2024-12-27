// import 'package:flutter/material.dart';

// class OrdersOngoingPage extends StatelessWidget {
//   const OrdersOngoingPage({Key? key}) : super(key: key);

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
//                     // Stay on the current page
//                   },
//                   child: const Text(
//                     'Ongoing',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.brown,
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(context, '/ordersHistory');
//                   },
//                   child: Text(
//                     'History',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey.shade500,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(color: Colors.grey),

//           // Ongoing Order Status
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16.0),
//               children: [
//                 Column(
//                   children: [
//                     OrderStatus(
//                       status: "We are packing your items...",
//                       icon: Icons.shopping_bag,
//                       isComplete: true,
//                     ),
//                     OrderStatus(
//                       status: "Your order is delivering to your location...",
//                       icon: Icons.local_shipping,
//                       isComplete: true,
//                     ),
//                     OrderStatus(
//                       status: "Your order is received.",
//                       icon: Icons.check_circle,
//                       isComplete: false,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OrderStatus extends StatelessWidget {
//   final String status;
//   final IconData icon;
//   final bool isComplete;

//   const OrderStatus({
//     Key? key,
//     required this.status,
//     required this.icon,
//     required this.isComplete,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             Icon(
//               icon,
//               color: isComplete ? Colors.green : Colors.grey,
//               size: 30,
//             ),
//             Container(
//               height: 50,
//               width: 2,
//               color: Colors.grey,
//             ),
//           ],
//         ),
//         const SizedBox(width: 16),
//         Text(
//           status,
//           style: TextStyle(
//             fontSize: 14,
//             color: isComplete ? Colors.black : Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';

class OrdersOngoingPage extends StatelessWidget {
  const OrdersOngoingPage({Key? key}) : super(key: key);

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
                    // Stay on the current page
                  },
                  child: const Text(
                    'Ongoing',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/orderHistory');
                  },
                  child: Text(
                    'History',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),

          // Ongoing Order Status
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Column(
                  children: [
                    OrderStatus(
                      status: "We are packing your items...",
                      icon: Icons.shopping_bag,
                      isComplete: true,
                    ),
                    OrderStatus(
                      status: "Your order is delivering to your location...",
                      icon: Icons.local_shipping,
                      isComplete: true,
                    ),
                    OrderStatus(
                      status: "Your order is received.",
                      icon: Icons.check_circle,
                      isComplete: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        currentIndex: 4, // Adjust based on current page
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/cart');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/categories');
          } else if (index == 0) {
            Navigator.pushNamed(context, '/home');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),
    );
  }
}

class OrderStatus extends StatelessWidget {
  final String status;
  final IconData icon;
  final bool isComplete;

  const OrderStatus({
    Key? key,
    required this.status,
    required this.icon,
    required this.isComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              icon,
              color: isComplete ? Colors.green : Colors.grey,
              size: 30,
            ),
            Container(
              height: 50,
              width: 2,
              color: Colors.grey,
            ),
          ],
        ),
        const SizedBox(width: 16),
        Text(
          status,
          style: TextStyle(
            fontSize: 14,
            color: isComplete ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}
