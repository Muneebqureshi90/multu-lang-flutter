import 'package:flutter/material.dart';
import 'home_page.dart';

class CancelPaymentWidget extends StatelessWidget {
  const CancelPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon Section
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red, // Red for canceled
              ),
              child: const Icon(
                Icons.cancel,
                size: 80,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Payment Canceled Message
          const Text(
            'Payment Canceled',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Your payment has been canceled.',
            textAlign: TextAlign.center,
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
                // Retry Payment Action
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
          TextButton(
            onPressed: () {
              // Navigate to Homepage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage1Widget()),
              );
            },
            child: const Text(
              'Go to Homepage',
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
