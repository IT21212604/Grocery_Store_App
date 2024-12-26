import 'package:flutter/material.dart';
import 'home.dart';
import 'categories.dart';
import 'cart.dart';
import 'fruitsDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FruitsPage(),
    );
  }
}

class FruitsPage extends StatelessWidget {
  const FruitsPage({Key? key}) : super(key: key);

  final List<Map<String, String>> fruits = const [
    {'name': 'Red Apple', 'price': '\$4.99', 'weight': '1kg', 'image': 'assets/apple.png', 'description': 'Fresh and juicy apples'},
    {'name': 'Avocado Bowl', 'price': '\$3.99', 'weight': '1kg', 'image': 'assets/avocado.png', 'description': 'Creamy avocados in a bowl'},
    {'name': 'Original Banana', 'price': '\$5.99', 'weight': '1kg', 'image': 'assets/banana.png', 'description': 'Organic bananas'},
    {'name': 'Original Mango', 'price': '\$3.99', 'weight': '1kg', 'image': 'assets/mango.png', 'description': 'Golden ripe Alphonso mangoes'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: GridView.builder(
                itemCount: fruits.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final fruit = fruits[index];
                  final isLocalImage = fruit['image']!.startsWith('assets/'); // Check if it's a local image path
                  return FruitCard(
                    name: fruit['name']!,
                    price: fruit['price']!,
                    weight: fruit['weight']!,
                    image: fruit['image']!,
                    description: fruit['description']!, // Pass description to FruitCard
                    isLocalImage: isLocalImage,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          }
          if (index == 1) return;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}

class FruitCard extends StatelessWidget {
  final String name;
  final String price;
  final String weight;
  final String image;
  final String description;
  final bool isLocalImage;

  const FruitCard({
    Key? key,
    required this.name,
    required this.price,
    required this.weight,
    required this.image,
    required this.description,
    required this.isLocalImage,
  }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FruitDetailsPage(
                name: name,
                price: price,
                image: image,
                description: description,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: isLocalImage
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )
                    : Center(
                        child: Text(
                          image,
                          style: const TextStyle(fontSize: 80),
                        ),
                      ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Text(
                weight,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
    }
  }
