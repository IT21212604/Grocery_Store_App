import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/welcome.PNG'), // Add your asset
            ),
            const Text(
              "Join us for a fresher experience!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFA1371B), // Updated color
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Fresh finds are a click away.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA1371B), // Updated button color
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white), // Updated text color
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFA1371B)), // Updated border color
              ),
              child: const Text(
                "Sign In",
                style: TextStyle(color: Color(0xFFA1371B)), // Updated text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
