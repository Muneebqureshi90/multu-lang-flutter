import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveReceipt(Map<String, dynamic> receipt) async {
    await _firestore.collection('receipts').add(receipt);
  }
}
