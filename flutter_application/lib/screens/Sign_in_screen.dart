import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
          children: [
            const Text(
              "Sign In",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFA1371B)),
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
              "Enter your phone number and password to access your account",
              style: TextStyle(fontSize: 16, color: Color(0xFFA1371B)),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "PhoneNumber",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign-in logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA1371B),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                "Sign In",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/password'); // Navigate to Password Reset
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 16, color: Color(0xFFA1371B)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
