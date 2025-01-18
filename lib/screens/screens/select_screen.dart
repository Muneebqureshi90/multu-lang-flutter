import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Import the SignupWidget
import 'login_screen.dart'; // Import the LoginWidget

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(23, 23, 23, 1),
        ),
        child: Stack(
          children: <Widget>[
            // Background Image
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/pexels-thelazyartist-1342609.jpg'), // Your background image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(23, 23, 23, 1),
                      Color.fromRGBO(23, 23, 23, 0.5),
                    ],
                  ),
                ),
              ),
            ),
            // Main Text Content
            const Positioned(
              bottom: 240,
              left: 25,
              child: Text(
                'The latest clothes of the day',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Jost',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  height: 1.23,
                ),
              ),
            ),
            const Positioned(
              bottom: 190,
              left: 25,
              right: 25,
              child: Text(
                'A premium online store for Men & Women to find their stylish choice.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Jost',
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  height: 1.3,
                ),
              ),
            ),
            // Sign Up Button
            Positioned(
              bottom: 120,
              left: 16,
              right: 16,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  // Navigate to SignupWidget
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupWidget()),
                  );
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color.fromRGBO(23, 23, 23, 1),
                    fontSize: 16,
                    fontFamily: 'Jost',
                  ),
                ),
              ),
            ),
            // Log In Button
            Positioned(
              bottom: 60,
              left: 16,
              right: 16,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.white),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  // Navigate to LoginWidget
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginWidget()),
                  );
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Jost',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
