import 'package:flutter/material.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({super.key});

  @override
  _ReceiptScreenState createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  String selectedLanguage = 'English';
  String selectedCurrency = 'USD';

  final Map<String, Map<String, String>> translations = {
    'English': {
      'productName': 'White & Light Blue T-Shirt',
      'productDescription':
          'A stylish white and light blue t-shirt for casual wear.',
      'price': '\$15.99',
    },
    'Español': {
      'productName': 'Camiseta Blanca y Azul Claro',
      'productDescription':
          'Una camiseta blanca y azul claro para ropa casual.',
      'price': '€15.99',
    },
    'Français': {
      'productName': 'T-shirt Blanc et Bleu Clair',
      'productDescription':
          'Un t-shirt blanc et bleu clair pour une tenue décontractée.',
      'price': '€15,99',
    },
    'हिन्दी': {
      'productName': 'सफेद और हल्का नीला टी-शर्ट',
      'productDescription':
          'कैजुअल पहनने के लिए एक स्टाइलिश सफेद और हल्का नीला टी-शर्ट।',
      'price': '₹2499.99',
    },
    'اردو': {
      'productName': 'سفید اور ہلکا نیلا ٹی شرٹ',
      'productDescription':
          'کژول پہننے کے لیے ایک اسٹائلش سفید اور ہلکا نیلا ٹی شرٹ۔',
      'price': '₨2499.99',
    },
    'Deutsch': {
      'productName': 'Weißes & Hellblaues T-Shirt',
      'productDescription':
          'Ein stilvolles weißes und hellblaues T-Shirt für Freizeitkleidung.',
      'price': '€14,99',
    },
    '中文': {
      'productName': '白色和浅蓝色T恤',
      'productDescription': '一款时尚的白色和浅蓝色T恤，适合休闲穿着。',
      'price': '¥199.99',
    },
  };

  final Map<String, Map<String, String>> currencySymbols = {
    'USD': {'symbol': '\$', 'exchangeRate': '1.0'},
    'EUR': {'symbol': '€', 'exchangeRate': '0.92'},
    'GBP': {'symbol': '£', 'exchangeRate': '0.78'},
    'INR': {'symbol': '₹', 'exchangeRate': '74.0'},
    'PKR': {'symbol': '₨', 'exchangeRate': '287.0'},
    'CNY': {'symbol': '¥', 'exchangeRate': '6.5'},
  };

  String get translatedPrice {
    double priceInUSD = 29.99;
    double exchangeRate = double.tryParse(
            currencySymbols[selectedCurrency]!['exchangeRate'] ?? '1') ??
        1;
    double convertedPrice = priceInUSD * exchangeRate;

    return '${currencySymbols[selectedCurrency]!['symbol']}${convertedPrice.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the product information based on selected language
    String productName = translations[selectedLanguage]!['productName']!;
    String productDescription =
        translations[selectedLanguage]!['productDescription']!;
    String productPrice = translatedPrice;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Receipt Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 5,
        actions: [
          // Language Dropdown Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton<String>(
              value: selectedLanguage,
              icon: const Icon(Icons.language, color: Colors.white),
              dropdownColor: Colors.black,
              underline: Container(),
              style: const TextStyle(color: Colors.white),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
              items: [
                'English',
                'Español',
                'Français',
                'हिन्दी',
                'اردو',
                'Deutsch',
                '中文'
              ].map<DropdownMenuItem<String>>((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/images/images (2).jpg', // Update with correct image file
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              productName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              productDescription,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Price: $productPrice',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Logic to proceed with the purchase
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Purchase successful!"),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                label: const Text('Buy Now', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 60),
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Currency Dropdown Button with icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<String>(
                value: selectedCurrency,
                icon: const Icon(Icons.monetization_on, color: Colors.white),
                dropdownColor: Colors.black,
                underline: Container(),
                style: const TextStyle(color: Colors.white),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCurrency = newValue!;
                  });
                },
                items: ['USD', 'EUR', 'GBP', 'INR', 'PKR', 'CNY']
                    .map<DropdownMenuItem<String>>((String currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Row(
                      children: [
                        Text(currency),
                        const SizedBox(width: 10),
                        Text(
                          currencySymbols[currency]!['symbol']!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
