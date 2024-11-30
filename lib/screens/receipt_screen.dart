import 'package:flutter/material.dart';
import '../widgets/receipt_widget.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Neutral 900 background
      appBar: AppBar(
        title: const Text('Receipt'),
        backgroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ReceiptWidget(),
      ),
    );
  }
}
