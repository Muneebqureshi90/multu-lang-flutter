import 'dart:async'; // Required for Timer
import 'package:flutter/material.dart';
import 'select_screen.dart'; // Import your SelectScreen file here

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to SelectScreen after 3 seconds
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SelectScreen()),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/pexels-chloekalaartist-1043474.jpg'), // Path to your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered Icon
          Center(
            child: Container(
              width: 100, // Adjust size as needed
              height: 100, // Adjust size as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow
                    .withOpacity(0.5), // Optional background for the icon
              ),
              child: const Center(
                child: Text(
                  'Z', // Replace with your custom icon or widget
                  style: TextStyle(
                    color: Colors.black, // Adjust color
                    fontSize: 60, // Adjust size as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
