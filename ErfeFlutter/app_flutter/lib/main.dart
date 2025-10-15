import 'package:flutter/material.dart';
import 'screens/form_screen.dart';
import 'screens/product_form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Forms',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Changed from pink to teal for a different vibe
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black), // Updated property name
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87), // Updated property name
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registration Forms',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white), // Changed the font size and weight
        ),
        backgroundColor: Colors.deepPurple, // Changed the app bar color to deep purple
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserFormScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange, // Changed from blue to deep orange
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 22), // Slightly larger padding
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Increased font size and added bold
              ),
              child: const Text('User Registration Form'),
            ),
            const SizedBox(height: 30), // Increased spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductFormScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo, // Changed from yellow to indigo
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 22),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              child: const Text('Product Registration Form'),
            ),
          ],
        ),
      ),
    );
  }
}
