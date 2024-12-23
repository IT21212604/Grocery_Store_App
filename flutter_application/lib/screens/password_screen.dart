import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center, // Center aligns text
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
                'assets/password.jpg', // Replace with your image path
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter the password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFA1371B), // Updated font color
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "For the security & safety please choose a password.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFA1371B), // Updated font color
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: const Icon(Icons.visibility),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                suffixIcon: const Icon(Icons.visibility),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to SignCodeScreen when the "Next" button is pressed
                  Navigator.pushNamed(context, '/signcode');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA1371B), // Updated button color
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white, // Updated font color for "Next"
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
