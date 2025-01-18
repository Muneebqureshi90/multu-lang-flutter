// import 'package:flutter/material.dart';
// import '../services/auth_service.dart';
// import 'signup_screen.dart';
// import 'home_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;
//   bool _rememberMe = false;
//
//   // Simulate a login process
//   void _login() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       setState(() {
//         _isLoading = true;
//       });
//
//       try {
//         final authService = AuthService();
//         await authService.login(
//           _emailController.text.trim(),
//           _passwordController.text.trim(),
//         );
//
//         // Navigate to the home screen after successful login
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const HomeScreen()),
//         );
//       } catch (e) {
//         // Display error message
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Login Failed'),
//             content: Text(e.toString()),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text(
//           'Login',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Center(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 150),
//                   Text(
//                     'Welcome Back!',
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                         ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: Icon(Icons.email, color: Colors.white),
//                       border: OutlineInputBorder(),
//                       labelStyle: TextStyle(color: Colors.white),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     style: const TextStyle(color: Colors.white),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter an email';
//                       } else if (!RegExp(
//                               r"^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$")
//                           .hasMatch(value)) {
//                         return 'Enter a valid email address';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   TextFormField(
//                     controller: _passwordController,
//                     decoration: const InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: Icon(Icons.lock, color: Colors.white),
//                       border: OutlineInputBorder(),
//                       labelStyle: TextStyle(color: Colors.white),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                     ),
//                     obscureText: true,
//                     style: const TextStyle(color: Colors.white),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a password';
//                       } else if (value.length < 6) {
//                         return 'Password should be at least 6 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: _rememberMe,
//                             onChanged: (value) {
//                               setState(() {
//                                 _rememberMe = value ?? false;
//                               });
//                             },
//                           ),
//                           const Text(
//                             'Remember Me',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           // Navigate to Forgot Password screen
//                           // Placeholder function
//                         },
//                         child: const Text(
//                           'Forgot Password?',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   _isLoading
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : ElevatedButton(
//                           onPressed: _login,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: Colors.black,
//                             minimumSize: const Size(double.infinity, 50),
//                           ),
//                           child: const Text('Login'),
//                         ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.email, color: Colors.white),
//                         onPressed: () {
//                           // Add Google login logic here
//                         },
//                       ),
//                       const SizedBox(width: 20),
//                       IconButton(
//                         icon: const Icon(Icons.apple, color: Colors.white),
//                         onPressed: () {
//                           // Add Apple login logic here
//                         },
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => const SignupScreen()),
//                       );
//                     },
//                     child: const Text(
//                       'Don\'t have an account? Sign Up',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
