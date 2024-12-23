import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFA1371B)), // Updated color
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFA1371B), // Updated color
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/signup.jpg', // Add your asset
                width: 200, // Increased width
                height: 200, // Increased height
                fit: BoxFit.cover, // Ensures proper scaling
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name Surname',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We need to verify you. We will send you a one-time verification code.",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFA1371B), // Updated color
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/password'); // Navigate to Password screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA1371B), // Updated button color
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.white), // Updated text color
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signin'); // Navigate to SignInScreen
              },
              child: const Text(
                "Already have an account? Login",
                style: TextStyle(color: Color(0xFFA1371B)), // Updated color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
