// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:multi_language_currency_app/screens/select_screen.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});
//
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _phoneController = TextEditingController();
//   DateTime? _selectedDate;
//
//   // This function will handle form submission
//   Future<void> _signup() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       try {
//         // Create a new user with email and password
//         UserCredential userCredential =
//             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text,
//         );
//
//         // Add additional user info to Firestore
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(userCredential.user?.uid)
//             .set({
//           'email': _emailController.text,
//           'name': _nameController.text,
//           'phoneNumber': _phoneController.text,
//           'createdAt': DateTime.now(),
//         });
//
//         // Send email verification
//         await userCredential.user?.sendEmailVerification();
//
//         // Show a confirmation message
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//               content: Text(
//                   'Signup Successful! A verification email has been sent.')),
//         );
//
//         // Navigate to Login Screen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const LoginScreen()),
//         ); // Ensure you have '/login' route set up in your app
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'email-already-in-use') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('This email is already in use.')),
//           );
//         } else if (e.code == 'weak-password') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('Password must be at least 6 characters.')),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(e.message ?? 'Signup failed.')),
//           );
//         }
//       }
//     }
//   }
//
//   // Function to pick date
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, // Set background color to black
//       appBar: AppBar(
//         title: const Text(
//           'Sign Up',
//           style:
//               TextStyle(color: Colors.white), // Set title text color to white
//         ),
//         backgroundColor: Colors.black, // Dark background for the app bar
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               shrinkWrap: true,
//               children: [
//                 // Name Field
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Full Name',
//                     labelStyle: TextStyle(color: Colors.white),
//                     prefixIcon: Icon(Icons.person, color: Colors.white),
//                     border: OutlineInputBorder(),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   style: const TextStyle(color: Colors.white),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 12),
//
//                 // Email Field
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     labelStyle: TextStyle(color: Colors.white),
//                     prefixIcon: Icon(Icons.email, color: Colors.white),
//                     border: OutlineInputBorder(),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   style: const TextStyle(color: Colors.white),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter an email';
//                     } else if (!RegExp(
//                             r"^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$")
//                         .hasMatch(value)) {
//                       return 'Enter a valid email address';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 12),
//
//                 // Password Field
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     labelStyle: TextStyle(color: Colors.white),
//                     prefixIcon: Icon(Icons.lock, color: Colors.white),
//                     border: OutlineInputBorder(),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   obscureText: true,
//                   style: const TextStyle(color: Colors.white),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     } else if (value.length < 6) {
//                       return 'Password should be at least 6 characters';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 12),
//
//                 // Confirm Password Field
//                 TextFormField(
//                   controller: _confirmPasswordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Confirm Password',
//                     labelStyle: TextStyle(color: Colors.white),
//                     prefixIcon: Icon(Icons.lock, color: Colors.white),
//                     border: OutlineInputBorder(),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   obscureText: true,
//                   style: const TextStyle(color: Colors.white),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please confirm your password';
//                     } else if (value != _passwordController.text) {
//                       return 'Passwords do not match';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 12),
//
//                 // Phone Number Field
//                 TextFormField(
//                   controller: _phoneController,
//                   decoration: const InputDecoration(
//                     labelText: 'Phone Number',
//                     labelStyle: TextStyle(color: Colors.white),
//                     prefixIcon: Icon(Icons.phone, color: Colors.white),
//                     border: OutlineInputBorder(),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   keyboardType: TextInputType.phone,
//                   style: const TextStyle(color: Colors.white),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your phone number';
//                     } else if (value.length != 10) {
//                       return 'Enter a valid phone number';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 12),
//
//                 // Date of Birth Picker
//                 ListTile(
//                   title: Text(
//                     _selectedDate == null
//                         ? 'Select Date of Birth'
//                         : 'Date of Birth: ${_selectedDate!.toLocal()}'
//                             .split(' ')[0],
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                   trailing:
//                       const Icon(Icons.calendar_today, color: Colors.white),
//                   onTap: () => _selectDate(context),
//                 ),
//                 const SizedBox(height: 24),
//
//                 // Sign Up Button
//                 ElevatedButton(
//                   onPressed: _signup,
//                   child: const Text('Sign Up'),
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white, // Button background color
//                       foregroundColor: Colors.black, // Button text color
//                       minimumSize: const Size(double.infinity, 50)),
//                 ),
//                 const SizedBox(height: 10),
//
//                 // Already have an account link
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context); // Navigate back to the login screen
//                   },
//                   child: const Text(
//                     'Already have an account? Log in',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
