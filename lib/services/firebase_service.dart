import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save receipt to Firestore
  Future<void> saveReceipt(Map<String, dynamic> receipt) async {
    if (receipt.isEmpty) {
      throw Exception('Receipt data cannot be empty.');
    }

    try {
      await _firestore.collection('receipts').add(receipt);
    } catch (e) {
      throw Exception('Failed to save receipt: ${e.toString()}');
    }
  }
}
