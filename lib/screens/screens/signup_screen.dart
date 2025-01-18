import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth_service.dart'; // Ensure the path is correct
import 'verify_screen.dart'; // Replace with your ConfirmWidget/VerifyScreen import
import 'login_screen.dart'; // Replace with your LoginWidget/LoginScreen import

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _signup() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if (kDebugMode) {
        print("Signup started...");
      }
      User? user = await _authService.signup(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _nameController.text.trim(),
        _phoneController.text.trim(),
      );

      if (user != null) {
        if (kDebugMode) {
          print("Signup successful! User: ${user.email}");
        }
        // Navigate to VerifyScreen on successful signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ConfirmWidget()),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("Signup failed: $e");
      }
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            // App Logo
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
                child: const Center(
                  child: Text(
                    'Z',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Sign up with Apple Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 2,
              ),
              onPressed: () {
                // Add Apple sign-up logic here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/apple.svg',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Sign up with Apple',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Sign up with Google Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 2,
              ),
              onPressed: () {
                // Add Google sign-up logic here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/google.svg',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Sign up with Google',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Name Input
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(220, 220, 220, 1),
                  fontSize: 14,
                ),
                filled: true,
                fillColor: const Color.fromRGBO(42, 42, 42, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 15),

            // Email Input
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(220, 220, 220, 1),
                  fontSize: 14,
                ),
                filled: true,
                fillColor: const Color.fromRGBO(42, 42, 42, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 15),

            // Password Input
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(220, 220, 220, 1),
                  fontSize: 14,
                ),
                filled: true,
                fillColor: const Color.fromRGBO(42, 42, 42, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 15),

            // Phone Input
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(220, 220, 220, 1),
                  fontSize: 14,
                ),
                filled: true,
                fillColor: const Color.fromRGBO(42, 42, 42, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 30),

            // Sign Up Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800], // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 14), // Padding inside button
                elevation: 0, // No shadow effect
                minimumSize: const Size(200, 50), // Width: 200, Height: 50
              ),
              onPressed: _isLoading
                  ? null // Disable button while loading
                  : _signup, // Call the signup function
              child: _isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white), // Spinner color
                    )
                  : const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize:
                            18, // Increased font size for better readability
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.white, // Text color
                      ),
                    ),
            ),

            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            const SizedBox(height: 20),

            // Footer Text
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginWidget()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already use ZappyCloset? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    text: 'By signing up you accept the ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms of Service ',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
