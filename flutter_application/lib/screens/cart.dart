import 'package:flutter/material.dart';
import 'home.dart';
import 'categories.dart';
import 'fruits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> items = [
    CartItem(
        name: "Red Apple",
        price: 4.99,
        unit: "kg",
        quantity: 1,
        image: "assets/apple.png"),
    CartItem(
        name: "Original Banana",
        price: 5.99,
        unit: "kg",
        quantity: 1,
        image: "assets/banana.png"),
    CartItem(
        name: "Avocado Bowl",
        price: 24.0,
        unit: "st",
        quantity: 1,
        image: "assets/avocado.png"),
    CartItem(
        name: "Salmon",
        price: 50.0,
        unit: "kg",
        quantity: 1,
        image: "assets/salmon.png"),
  ];

  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      items[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (items[index].quantity > 1) {
        items[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  item: items[index],
                  onRemove: () => _removeItem(index),
                  onIncrement: () => _incrementQuantity(index),
                  onDecrement: () => _decrementQuantity(index),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text("CheckOut",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            // home page index
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoriesPage()),
            );
          }
          if (index == 2) return;
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

class CartItem {
  final String name;
  final double price;
  final String unit;
  int quantity;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    required this.unit,
    required this.quantity,
    required this.image,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(item.image, width: 50, height: 50),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${item.price} ${item.unit}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline,
                    color: Colors.brown),
                onPressed: onDecrement,
              ),
              Text(
                "${item.quantity}",
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.brown),
                onPressed: onIncrement,
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.black),
                onPressed: onRemove,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
