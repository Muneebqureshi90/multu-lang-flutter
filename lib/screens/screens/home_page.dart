import 'package:flutter/material.dart';
import 'product_details_screen.dart'; // Import the ProductDetailsWidget screen.

class Homepage1Widget extends StatefulWidget {
  @override
  _Homepage1WidgetState createState() => _Homepage1WidgetState();
}

class _Homepage1WidgetState extends State<Homepage1Widget> {
  // Default language and currency conversion mapping
  String selectedLanguage = 'English';
  Map<String, double> currencyConversion = {
    'English': 1.0, // USD
    'Hindi': 75.0, // INR
    'Urdu': 275.0, // PKR
  };

  // Product titles in different languages
  List<Map<String, String>> productTitles = [
    {
      'English': 'Blue Jacket',
      'Hindi': 'हरा लंबी आस्तीन',
      'Urdu': 'سبز لمبی بازو'
    },
    {
      'English': 'Blue Denim Pent',
      'Hindi': 'नीली डेनिम शर्ट',
      'Urdu': 'نیلی ڈینم شرٹ'
    },
    {'English': 'Fellow Shirt', 'Hindi': 'हुड वाली जैकेट', 'Urdu': 'ہوڈڈ جیکٹ'},
    {
      'English': 'White T-Shirt',
      'Hindi': 'सफेद टी शर्ट',
      'Urdu': 'سفید ٹی شرٹ'
    },
    {
      'English': 'Gray Pants',
      'Hindi': 'काली सूती पैंट',
      'Urdu': 'کالی کاٹن پینٹ'
    },
  ];

  // Get currency symbol based on selected language
  String getCurrencySymbol() {
    switch (selectedLanguage) {
      case 'Hindi':
        return '₹';
      case 'Urdu':
        return '₨';
      default:
        return '\$';
    }
  }

  // Update selected language
  void _updateLanguage(String value) {
    setState(() {
      selectedLanguage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // App Title
                    const Text(
                      'ZappyCloset',
                      style: TextStyle(
                        color: Color.fromRGBO(201, 197, 46, 1),
                        fontFamily: 'Jost',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Language Dropdown and Profile Image
                    Row(
                      children: [
                        DropdownButton<String>(
                          dropdownColor: const Color.fromRGBO(42, 42, 42, 1),
                          value: selectedLanguage,
                          items: const [
                            DropdownMenuItem(
                              value: 'English',
                              child: Text(
                                'English',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Hindi',
                              child: Text(
                                'Hindi',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Urdu',
                              child: Text(
                                'Urdu',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              _updateLanguage(value);
                            }
                          },
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.white),
                          underline: Container(), // Remove underline
                        ),
                        const SizedBox(width: 16),
                        // Profile Image
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            'assets/images/download (5).jpeg', // Replace with your actual path
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Welcome Message
                Text(
                  selectedLanguage == 'Urdu'
                      ? 'خوش آمدید'
                      : selectedLanguage == 'Hindi'
                          ? 'स्वागत है'
                          : 'Welcome',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Jost',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  selectedLanguage == 'Urdu'
                      ? 'زاپی کلوزٹ اسٹور!'
                      : selectedLanguage == 'Hindi'
                          ? 'ज़ैप्पी क्लोसेट स्टोर!'
                          : 'Zappy Closet Store!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Jost',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                // All Collection Section
                const SectionTitle(title: 'All Collection'),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      CategoryButton(label: 'All collections'),
                      SizedBox(width: 8),
                      CategoryButton(label: 'Trousers'),
                      SizedBox(width: 8),
                      CategoryButton(label: 'Denims'),
                      SizedBox(width: 8),
                      CategoryButton(label: 'Shorts'),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // All Products Section
                const SectionTitle(title: 'All Products'),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: productTitles.length,
                  itemBuilder: (context, index) {
                    final image = [
                      'assets/images/pexels-blitzboy-1040945.jpg',
                      'assets/images/download (1).jpg',
                      'assets/images/pexels-prayoon-sajeev-1486107-2897531 (1).jpg',
                      'assets/images/pexels-nietjuh-934070.jpg',
                      'assets/images/pexels-hazardos-1306248.jpg'
                    ][index];
                    final title = productTitles[index][selectedLanguage]!;
                    final price =
                        '${getCurrencySymbol()}${(20 + index * 10 * currencyConversion[selectedLanguage]!).toStringAsFixed(2)}';

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductdetailsWidget(),
                          ),
                        );
                      },
                      child: ProductCard(
                        image: image,
                        title: title,
                        price: price,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Jost',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(42, 42, 42, 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Jost',
          fontSize: 12,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductCard({
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(42, 42, 42, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Jost',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Jost',
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
