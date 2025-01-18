import 'package:flutter/material.dart';

import 'add_card_details.dart';
import 'checkout_screen.dart';

class MyCartWidget extends StatefulWidget {
  @override
  _MyCartWidgetState createState() => _MyCartWidgetState();
}

class _MyCartWidgetState extends State<MyCartWidget> {
  String selectedLanguage = 'English';
  String selectedCurrency = '\$'; // Default currency
  double subtotal = 165.98;
  double shippingFee = 5.02;

  final List<Map<String, dynamic>> cartItems = [
    {
      'name': "Women's Original Levi's Denim",
      'size': '32',
      'image':
          'assets/images/pexels-prayoon-sajeev-1486107-2897531.jpg', // Replace with your image path
      'price': 82.99,
      'quantity': 1,
    },
    {
      'name': "Men's Long Sleeve T-Shirt",
      'size': 'M',
      'image':
          'assets/images/pexels-nietjuh-934070.jpg', // Replace with your image path
      'price': 82.99,
      'quantity': 1,
    },
  ];

  void _updateLanguage(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  void _updateCurrency(String currency) {
    setState(() {
      selectedCurrency = currency;
    });
  }

  double calculateTotal() {
    return subtotal + shippingFee;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          selectedLanguage == 'Urdu'
              ? 'میرا کارٹ'
              : selectedLanguage == 'Hindi'
                  ? 'मेरा कार्ट'
                  : 'My Cart',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          DropdownButton<String>(
            value: selectedLanguage,
            items: const [
              DropdownMenuItem(value: 'English', child: Text('English')),
              DropdownMenuItem(value: 'Hindi', child: Text('Hindi')),
              DropdownMenuItem(value: 'Urdu', child: Text('Urdu')),
            ],
            onChanged: (value) {
              if (value != null) _updateLanguage(value);
            },
            underline: Container(),
            dropdownColor: Colors.black,
            style: const TextStyle(color: Colors.white),
            icon: const Icon(Icons.language, color: Colors.white),
          ),
          DropdownButton<String>(
            value: selectedCurrency,
            items: const [
              DropdownMenuItem(value: '\$', child: Text('\$')),
              DropdownMenuItem(value: '₹', child: Text('₹')),
              DropdownMenuItem(value: '₨', child: Text('₨')),
            ],
            onChanged: (value) {
              if (value != null) _updateCurrency(value);
            },
            underline: Container(),
            dropdownColor: Colors.black,
            style: const TextStyle(color: Colors.white),
            icon: const Icon(Icons.monetization_on, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart Items List
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    color: Colors.grey[900],
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        // Product Image
                        Container(
                          width: screenWidth * 0.25,
                          height: screenWidth * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(item['image']),
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
                                item['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${selectedLanguage == 'Urdu' ? 'سائز' : selectedLanguage == 'Hindi' ? 'आकार' : 'Size'}: ${item['size']}',
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '$selectedCurrency${item['price'].toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Promo Code Section
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[800],
                      hintText: selectedLanguage == 'Urdu'
                          ? 'پرومو کوڈ'
                          : selectedLanguage == 'Hindi'
                              ? 'प्रोमो कोड'
                              : 'Promo code',
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: Text(
                    selectedLanguage == 'Urdu'
                        ? 'لاغو کریں'
                        : selectedLanguage == 'Hindi'
                            ? 'लागू करें'
                            : 'Apply',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Subtotal, Shipping Fee, Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedLanguage == 'Urdu'
                      ? 'ذیلی کل'
                      : selectedLanguage == 'Hindi'
                          ? 'उप कुल'
                          : 'Sub total',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  '$selectedCurrency${subtotal.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedLanguage == 'Urdu'
                      ? 'شپنگ فیس'
                      : selectedLanguage == 'Hindi'
                          ? 'शिपिंग शुल्क'
                          : 'Shipping fee',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  '$selectedCurrency${shippingFee.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedLanguage == 'Urdu'
                      ? 'کل'
                      : selectedLanguage == 'Hindi'
                          ? 'कुल'
                          : 'Total',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '$selectedCurrency${calculateTotal().toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24), // Increased spacing

            // Proceed to Checkout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutWidget(),
                    ),
                  );
                },
                child: Text(
                  selectedLanguage == 'Urdu'
                      ? 'چیک آؤٹ پر جائیں'
                      : selectedLanguage == 'Hindi'
                          ? 'चेकआउट पर जाएं'
                          : 'Proceed to Checkout',
                ),
              ),
            ),
            const SizedBox(height: 16), // Extra space below the button
          ],
        ),
      ),
    );
  }
}
