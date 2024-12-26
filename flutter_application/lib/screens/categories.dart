import 'package:flutter/material.dart';
import 'home.dart';
import 'cart.dart';
import 'fruits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categories',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CategoriesPage(),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  final List<Category> categories = const [
    Category(
      name: 'Fruits',
      image: 'assets/fruits.png',
      color: Colors.purple,
      route: FruitsPage(),
    ),
    Category(
      name: 'Vegetables',
      image: 'assets/vegetables.png',
      color: Colors.orange,
    ),
    Category(
      name: 'Meat',
      image: 'assets/meat.png',
      color: Colors.red,
    ),
    Category(
      name: 'Fish',
      image: 'assets/fish.png',
      color: Colors.pink,
    ),
    Category(
      name: 'Sea Food',
      image: 'assets/seafood.png',
      color: Colors.amber,
    ),
    Category(
      name: 'Juice',
      image: 'assets/juice.png',
      color: Colors.green,
    ),
    Category(
      name: 'Egg & Milk',
      image: 'assets/milk.png',
      color: Colors.lightBlue,
    ),
    Category(
      name: 'Ice Cream',
      image: 'assets/ice.png',
      color: Colors.pinkAccent,
    ),
    Category(
      name: 'Cake',
      image: 'assets/cake.png',
      color: Colors.brown,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
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
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryGridItem(category: category);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {
          if (index == 1) return; // Prevent navigating to itself
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          } else if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
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

class CategoryGridItem extends StatelessWidget {
  final Category category;

  const CategoryGridItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (category.route != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => category.route!),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: category.color.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.asset(
                  category.image,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            category.name,
            style: const TextStyle(fontSize: 12), // Correct placement of the style
          ),
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final String image;
  final Color color;
  final Widget? route;

  const Category({
    required this.name,
    required this.image,
    required this.color,
    this.route,
  });
}
