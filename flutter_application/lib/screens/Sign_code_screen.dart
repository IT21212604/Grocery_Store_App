import 'package:flutter/material.dart';

class SignCodeScreen extends StatelessWidget {
  const SignCodeScreen({Key? key}) : super(key: key);

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
              "Sign Up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFA1371B)),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/signcode.jpg', // Replace with your image path
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter Verification Code",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFA1371B)),
            ),
            const SizedBox(height: 20),
            const Text(
              "We have sent SMS to: 046 XXX XX XX",
              style: TextStyle(fontSize: 16, color: Color(0xFFA1371B)),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Code",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle code submission logic here
                Navigator.pushNamed(context, '/signin'); // Navigate to SignInScreen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA1371B),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
