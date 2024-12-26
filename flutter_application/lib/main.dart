import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/password_screen.dart';
import 'screens/Sign_in_screen.dart';
import 'screens/sign_code_screen.dart';
import 'screens/address_list.dart';
import 'screens/new_address.dart';
import 'screens/edit_address.dart';
import 'screens/cart_screen.dart';
import 'screens/order_confirmation_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/cart.dart';
import 'screens/home.dart';
import 'screens/fruits.dart';
import 'screens/categories.dart';
import 'screens/fruitsDetails.dart';
import 'screens/sign_details_screen.dart'; // Import the SignDetailsScreen

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
        '/': (context) => const WelcomeScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/password': (context) => const PasswordScreen(),
        '/signcode': (context) => const SignCodeScreen(),
        '/signin': (context) => SignInPage(),
        '/signDetails': (context) => const SignDetailsScreen(userDetails: {"surname": "John", "phone": "1234567890"}), // Sample initial data for testing
        '/addressList': (context) => AddressPage(),
        '/newAddress': (context) => NewAddress(),
        '/editAddress': (context) => EditAddress(
              index: 0,
              address: {"title": "Sample", "city": "Sample City", "address": "Sample Address"},
            ),
        '/cart': (context) => CartScreen(),
        '/order_confirmation': (context) => const OrderConfirmationScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/home': (context) => const HomeScreen(),
        '/cartPage': (context) => const CartPage(),
        '/fruits': (context) => const FruitsPage(),
        '/fruitsDetails': (context) => const FruitDetailsPage(
              name: 'Apple',
              price: '10.0',
              image: 'assets/apple.png',
              description: 'Fresh apples',
            ),
        '/categories': (context) => const CategoriesPage(),
      },
    );
  }
}
