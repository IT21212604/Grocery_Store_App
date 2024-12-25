import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/password_screen.dart';
import 'screens/Sign_in_screen.dart';
import 'screens/Sign_code_screen.dart';
import 'screens/address_list.dart';
import 'screens/new_address.dart';
import 'screens/edit_address.dart';


void main() {
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      // Set the initial route to the Welcome Screen
      initialRoute: '/',
      // Define all the routes
      routes: {
       '/addressList': (context) => AddressPage(),
        '/newAddress': (context) => NewAddress(),
        '/editAddress': (context) => EditAddress(
              index: 0,
              address: {"title": "Sample", "city": "Sample City", "address": "Sample Address"},
            ),
        '/': (context) => const WelcomeScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/password': (context) => const PasswordScreen(),
      '/signcode': (context) => const SignCodeScreen(), // Updated route name
    '/signin': (context) => const SignInScreen(),
  
      }
    );
  }
}

