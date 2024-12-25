import 'package:flutter/material.dart';
import 'new_address.dart';
import 'edit_address.dart'; // Correct path if in the same directory

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<Map<String, String>> addresses = [
    {"title": "Home", "city": "Horana", "address": "Dikhenagama, Munagama"},
    {"title": "Office", "city": "Lungangen", "address": "6, 41722"},
  ];

  // Function to add a new address
  void addAddress(Map<String, String> newAddress) {
    setState(() {
      addresses.add(newAddress);
    });
  }

  // Function to edit an existing address
  void editAddress(int index, Map<String, String> updatedAddress) {
    setState(() {
      addresses[index] = updatedAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Addresses',
          style: TextStyle(color: const Color.fromARGB(255, 243, 110, 33)), // Change title color
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back button color
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white, // Optional: change app bar background color
        elevation: 0, // Optional: remove app bar shadow
      ),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.home, color: Colors.grey), // Home icon
            title: Text(addresses[index]['title']!),
            subtitle: Text(
              '${addresses[index]['city']}, ${addresses[index]['address']}',
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit, color: Colors.blue), // Edit icon
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditAddress(
                      index: index,
                      address: addresses[index],
                    ),
                  ),
                );
                if (result != null) {
                  editAddress(index, result);
                }
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Active tab index
        onTap: (index) {
          // Handle tab navigation
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewAddress()),
          );
          if (result != null) {
            addAddress(result);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 243, 110, 33), // Optional: FAB color
      ),
    );
  }
}
