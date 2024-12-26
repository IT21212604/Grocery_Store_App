import 'package:flutter/material.dart';
import 'sign_details_screen.dart'; // Import SignDetailsScreen

class SignInPage extends StatelessWidget {
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFA1371B)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center the "Sign In" text
            Center(
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFA1371B),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/signin.jpg', // Replace with your actual image path
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter your surname and phone number to access your account",
              style: TextStyle(fontSize: 16, color: Color(0xFFA1371B)),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: surnameController,
              decoration: const InputDecoration(
                labelText: 'Surname',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final userDetails = {
                    'surname': surnameController.text.trim(),
                    'phone': phoneController.text.trim(),
                  };

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignDetailsScreen(userDetails: userDetails),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA1371B),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
