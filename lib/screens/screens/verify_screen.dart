import 'package:flutter/material.dart';

import 'home_page.dart';

class ConfirmWidget extends StatelessWidget {
  const ConfirmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Section
          Center(
            child: Container(
              width: 293,
              height: 293,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/Gif.png'), // Replace with your actual asset
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // "Check your email" Text
          const Text(
            'Check your email',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Jost',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Verification message
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'We sent an email to zappyCloset@gmail.com to verify your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Jost',
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 30),
          // "Open email" button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            ),
            onPressed: () {
              // Navigate to HomePage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage1Widget()),
              );
            },
            child: const Text(
              'Open email',
              style: TextStyle(
                color: Color.fromRGBO(23, 23, 23, 1),
                fontFamily: 'Jost',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
