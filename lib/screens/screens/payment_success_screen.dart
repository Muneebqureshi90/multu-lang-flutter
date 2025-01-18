import 'package:flutter/material.dart';
import 'home_page.dart';
import 'order_details.dart';

class PaymentSuccessWidget extends StatelessWidget {
  const PaymentSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: Column(
        children: [
          const SizedBox(height: 80), // Spacing for status bar
          // Success Icon Section with Surrounding Circles
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 80,
                      child: _buildSmallCircle(),
                    ),
                    Positioned(
                      top: 30,
                      left: 30,
                      child: _buildSmallCircle(),
                    ),
                    Positioned(
                      top: 30,
                      right: 30,
                      child: _buildSmallCircle(),
                    ),
                    Positioned(
                      top: 80,
                      right: 10,
                      child: _buildSmallCircle(),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 30,
                      child: _buildSmallCircle(),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 30,
                      child: _buildSmallCircle(),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 80,
                      child: _buildSmallCircle(),
                    ),
                    Positioned(
                      top: 10,
                      right: 80,
                      child: _buildSmallCircle(),
                    ),
                    Positioned(
                      bottom: 80,
                      left: 10,
                      child: _buildSmallCircle(),
                    ),
                    Positioned(
                      bottom: 80,
                      right: 10,
                      child: _buildSmallCircle(),
                    ),
                  ],
                ),
              ),
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(201, 197, 46, 1), // Yellow accent color
                ),
                child: const Icon(
                  Icons.check,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Payment Success Message
          const Text(
            'Payment success!',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Payment is completed!',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Your order number is #1089324',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),

          // Buttons Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // Navigate to Homepage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderDetailsWidget()),
                );
              },
              child: const Text(
                'Order Delivery Status',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 16,
                  color: Color.fromRGBO(23, 23, 23, 1),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Navigate to Homepage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage1Widget()),
              );
            },
            child: const Text(
              'Homepage',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 16,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallCircle() {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(201, 197, 46, 1), // Yellow accent color
      ),
    );
  }
}
