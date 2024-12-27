import 'package:flutter/material.dart';

class SignDetailsScreen extends StatefulWidget {
  final Map<String, String> userDetails; // Receive user details

  const SignDetailsScreen({Key? key, required this.userDetails})
      : super(key: key);

  @override
  _SignDetailsScreenState createState() => _SignDetailsScreenState();
}

class _SignDetailsScreenState extends State<SignDetailsScreen> {
  late String surname;
  late String phoneNumber;

  @override
  void initState() {
    super.initState();
    // Initialize data from received userDetails
    surname = widget.userDetails['surname'] ?? 'N/A';
    phoneNumber = widget.userDetails['phone'] ?? 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text(
        //   'Your Details',
        //   style: TextStyle(color: Colors.black),
        // ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Details',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFA1371B)),
            ),
            const SizedBox(height: 20),
            Text(
              'Surname: $surname',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              'Phone Number: $phoneNumber',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Home Page
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA1371B), // Custom color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  foregroundColor: Colors.white, // Set text color to white
                ),
                child: const Text(
                  'Add Item & Go Home',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
