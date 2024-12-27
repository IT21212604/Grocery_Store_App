import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const WelcomeScreen({Key? key, required this.themeNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Grocery App"),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/welcome.PNG'), // Add your asset
            ),
            Text(
              "Join us for a fresher experience!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xFFA1371B),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Fresh finds are a click away.",
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA1371B),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFA1371B)),
              ),
              child: const Text(
                "Sign In",
                style: TextStyle(color: Color(0xFFA1371B)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
