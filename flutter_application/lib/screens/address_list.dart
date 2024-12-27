import 'package:flutter/material.dart';
import 'new_address.dart';
import 'edit_address.dart';
import 'order_confirmation_screen.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<Map<String, String>> addresses = [
    {"title": "Home", "city": "Horana", "address": "Dikhenagama, Munagama"},
    {"title": "Office", "city": "Lungangen", "address": "6, 41722"},
  ];

  // Selected address index
  int? selectedAddressIndex;

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
          style: TextStyle(color: const Color.fromARGB(255, 243, 110, 33)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.home, color: Colors.grey),
                  title: Text(addresses[index]['title']!),
                  subtitle: Text(
                    '${addresses[index]['city']}, ${addresses[index]['address']}',
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
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
                  onTap: () {
                    setState(() {
                      selectedAddressIndex = index;
                    });
                  },
                  selected: selectedAddressIndex == index,
                  selectedTileColor: Colors.orange[100],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: selectedAddressIndex != null
                  ? () {
                      Navigator.pushNamed(context, '/payment');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 110, 33),
              ),
              child: Text('Proceed to Order Confirmation'),
            ),
          ),
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
        backgroundColor: const Color.fromARGB(255, 243, 110, 33),
      ),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  final Map<String, String> selectedAddress;

  OrderConfirmationPage({required this.selectedAddress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
        backgroundColor: const Color.fromARGB(255, 243, 110, 33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '${selectedAddress['title']}, ${selectedAddress['city']}, ${selectedAddress['address']}',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle order confirmation logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order placed successfully!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 110, 33),
              ),
              child: Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }
}
