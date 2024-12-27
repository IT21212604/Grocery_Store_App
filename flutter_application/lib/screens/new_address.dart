import 'package:flutter/material.dart';

class NewAddress extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Address',
          style: TextStyle(color: const Color.fromARGB(255, 243, 110, 33)),
        ),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: const Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                Navigator.pop(context, {
                  "title": titleController.text,
                  "city": cityController.text,
                  "address": addressController.text,
                });
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
