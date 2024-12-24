import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<GroceryItem> items = [
    GroceryItem('Red Apple', 4.99, 'assets/apple.png', 2, 'kg'),
    GroceryItem('Orginal Banana', 5.99, 'assets/banana.png', 2, 'kg'),
    GroceryItem('Avocado Bowl', 24, 'assets/avocado.png', 1, 'st'),
    GroceryItem('Salmon', 50, 'assets/salmon.png', 2, 'kg'),
  ];

  @override
  Widget build(BuildContext context) {
    double total = items.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Itemes',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Image.asset(
                        item.imageUrl,
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '\$${item.price} ${item.unit}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
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
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),
    );
  }
}

class GroceryItem {
  final String name;
  final double price;
  final String imageUrl;
  final int quantity;
  final String unit;

  GroceryItem(this.name, this.price, this.imageUrl, this.quantity, this.unit);
}