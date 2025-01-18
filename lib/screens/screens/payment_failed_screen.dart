import 'package:flutter/material.dart';
import 'home_page.dart';

class PaymentFailedWidget extends StatelessWidget {
  const PaymentFailedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Spacing for status bar
          const SizedBox(height: 80),

          // Failed Icon Section
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red, // Red color for failure
              ),
              child: const Icon(
                Icons.close,
                size: 80,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Payment Failed Message
          const Text(
            'Payment Failed',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Payment is Failed!',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),

          // Buttons Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // Handle retry navigation
              },
              child: const Text(
                'Retry Payment',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Navigate to Homepage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage1Widget()),
              );
            },
            child: const Text(
              'Homepage',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 16,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
