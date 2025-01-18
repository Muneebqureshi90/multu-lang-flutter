import 'package:flutter/material.dart';

import 'cart_screen.dart';

class ProductdetailsWidget extends StatefulWidget {
  const ProductdetailsWidget({Key? key}) : super(key: key);

  @override
  _ProductdetailsWidgetState createState() => _ProductdetailsWidgetState();
}

class _ProductdetailsWidgetState extends State<ProductdetailsWidget> {
  String selectedLanguage = 'English';

  // Method to handle language change
  void _updateLanguage(String value) {
    setState(() {
      selectedLanguage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          DropdownButton<String>(
            value: selectedLanguage,
            items: const [
              DropdownMenuItem(value: 'English', child: Text('English')),
              DropdownMenuItem(value: 'Hindi', child: Text('Hindi')),
              DropdownMenuItem(value: 'Urdu', child: Text('Urdu')),
            ],
            onChanged: (value) {
              if (value != null) {
                _updateLanguage(value);
              }
            },
            icon: const Icon(Icons.language, color: Colors.black),
            underline: Container(),
            dropdownColor: Colors.white,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Section
            Center(
              child: Image.asset(
                'assets/images/pexels-nietjuh-934070.jpg', // Replace with your product image
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Product Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedLanguage == 'Urdu'
                            ? "خواتین کی لیوی کی جینز"
                            : selectedLanguage == 'Hindi'
                                ? "महिलाओं की लेवी की जींस"
                                : "Women's Levi's Denims",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '\$82.99',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    selectedLanguage == 'Urdu'
                        ? "لیوی کی جینز آپ کی شبیہ کو مکمل کرے گی۔ یہ جینز کلاسیکی اور آرام دہ اسٹائل دونوں کے لیے موزوں ہے۔"
                        : selectedLanguage == 'Hindi'
                            ? "लेवी की जींस आपके लुक को परफेक्ट बनाएगी। यह जींस क्लासिक और कैजुअल स्टाइल दोनों के लिए उपयुक्त है।"
                            : "Levi's denim will perfectly complement your image. "
                                "This denim is suitable for both classic style and casual style.",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Color Options
                  const Text(
                    'Color',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildColorOption(Colors.pink),
                      const SizedBox(width: 8),
                      _buildColorOption(Colors.lightBlue),
                      const SizedBox(width: 8),
                      _buildColorOption(Colors.yellow),
                      const SizedBox(width: 8),
                      _buildColorOption(Colors.green),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Size Options
                  const Text(
                    'Size',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildSizeOption('S'),
                      const SizedBox(width: 8),
                      _buildSizeOption('M'),
                      const SizedBox(width: 8),
                      _buildSizeOption('L'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Quantity Selector
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, color: Colors.black),
                        onPressed: () {},
                      ),
                      const Text(
                        '1',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        // Navigate to HomePage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyCartWidget()),
                        );
                      },
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }

  Widget _buildSizeOption(String size) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        size,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
