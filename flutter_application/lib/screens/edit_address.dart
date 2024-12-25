import 'package:flutter/material.dart';

class EditAddress extends StatelessWidget {
  final int index;
  final Map<String, String> address;

  EditAddress({required this.index, required this.address});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize text controllers with existing address data
    titleController.text = address['title'] ?? '';
    cityController.text = address['city'] ?? '';
    addressController.text = address['address'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Address'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Address Title'),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Pass updated address data back to the previous screen
                Navigator.pop(context, {
                  "title": titleController.text,
                  "city": cityController.text,
                  "address": addressController.text,
                });
              },
              child: Text('Update Address'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Active tab index
        onTap: (index) {
          // Add functionality for navigation between tabs
          print("Tapped index: $index");
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
