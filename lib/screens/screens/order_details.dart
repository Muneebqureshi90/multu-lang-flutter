import 'package:flutter/material.dart';
import 'home_page.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171717),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171717),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigate to HomePage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage1Widget()),
            );
          },
        ),
        title: const Text(
          'Order details',
          style: TextStyle(
            fontFamily: 'Jost',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Header
            const Text(
              'Order #10802012',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Flexible(
                  child: Text(
                    'Placed on 07 Jan 2022 22:40:35',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Spacer(),
                Flexible(
                  child: Text(
                    'Estimated delivery: May 14 2022',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 12,
                      color: Color(0xFFC9C52E),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Product Details Section
            _buildProductItem(
              imagePath:
                  'assets/images/pexels-prayoon-sajeev-1486107-2897531.jpg',
              name: "Women's cotton bottoms",
              details: 'Color: grey | Size: Medium',
              price: '\$52.00',
              quantity: 'Qty: 2',
            ),
            const SizedBox(height: 16),
            _buildProductItem(
              imagePath: 'assets/images/pexels-nietjuh-934070.jpg',
              name: "Women's silk blouse",
              details: 'Color: yellow | Size: S',
              price: '\$27.98',
              quantity: 'Qty: 1',
            ),
            const SizedBox(height: 16),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildActionButton(
                    context: context,
                    label: 'Invoice',
                    onPressed: () {
                      // Handle Invoice
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildActionButton(
                    context: context,
                    label: 'Write review',
                    onPressed: () {
                      // Handle Review
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildActionButton(
                    context: context,
                    label: 'Get help',
                    backgroundColor: const Color(0xFFC9C52E),
                    textColor: Colors.black,
                    onPressed: () {
                      // Handle Support
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Delivery Section
            const Text(
              'Delivery',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'name: haider,\n'
              '123, colombo road,\n'
              'Sri Lanka\n'
              'ph: +94 12 123 46 07',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // Payment Section
            const Text(
              'Payment',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Visa **** 1655',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem({
    required String imagePath,
    required String name,
    required String details,
    required String price,
    required String quantity,
  }) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                details,
                style: const TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                quantity,
                style: const TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontFamily: 'Jost',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Jost',
          fontSize: 14,
          color: textColor,
        ),
      ),
    );
  }
}
