import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth import
import '../../services/auth_service.dart';
import 'home_page.dart'; // Import your HomePage widget
import 'signup_screen.dart'; // Import your SignupScreen widget

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService(); // Instance of AuthService

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      User? user = await _authService.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (user != null) {
        // Navigate to HomePage on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage1Widget()),
        );
      }
    } catch (e) {
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
            // Apple Login Button
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
                // Add Apple login logic here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/pexels-prayoon-sajeev-1486107-2897531.jpg', // Path to the Google icon
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Log in with Apple',
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
            // Google Login Button
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
                // Add Google login logic here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/apple.png', // Path to the Google icon
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Log in with Google',
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
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
              ),
              onPressed: _isLoading ? null : _login,
              child: _isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupWidget()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "Don't have ZappyCloset account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
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
                        text: 'Terms of service ',
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
