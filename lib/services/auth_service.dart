import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login user
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Remove email verification check since it's not being used
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found with this email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Invalid password.');
      } else {
        throw Exception(e.message ?? 'Login failed.');
      }
    }
  }

  // Signup user
  Future<User?> signup(
      String email, String password, String name, String phoneNumber) async {
    try {
      // Check if email is already in use
      final existingUser = await _auth.fetchSignInMethodsForEmail(email);
      if (existingUser.isNotEmpty) {
        throw Exception('This email is already in use.');
      }

      // Create the new user if email is not in use
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Add additional user info to Firestore
      if (userCredential.user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'email': email,
          'name': name,
          'phoneNumber': phoneNumber,
        });
        return userCredential.user;
      } else {
        throw Exception('User creation failed.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('Password must be at least 6 characters.');
      } else {
        throw Exception(e.message ?? 'Signup failed.');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  // Logout user
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Logout failed: ${e.toString()}');
    }
  }
}
