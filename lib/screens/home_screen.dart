import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/CurrencyModel.dart';
import '../model/LanguageModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          "Clothing Store",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildLanguageAndCurrencyDropdown(context),
          ),
        ],
      ),
      body: Consumer2<LanguageModel, CurrencyModel>(
        builder: (context, languageModel, currencyModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              // Wrap the content in a SingleChildScrollView
              child: Column(
                children: [
                  _buildProductGrid(
                    languageModel.selectedLanguage,
                    currencyModel.selectedCurrency,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLanguageAndCurrencyDropdown(BuildContext context) {
    return Row(
      children: [
        DropdownButton<String>(
          value: context.watch<LanguageModel>().selectedLanguage ?? 'English',
          dropdownColor: Colors.grey[800],
          style: const TextStyle(color: Colors.white),
          items: const [
            DropdownMenuItem(value: 'English', child: Text('English')),
            DropdownMenuItem(value: 'Français', child: Text('Français')),
            DropdownMenuItem(value: 'Español', child: Text('Español')),
            DropdownMenuItem(value: 'Deutsch', child: Text('Deutsch')),
            DropdownMenuItem(value: 'Italiano', child: Text('Italiano')),
            DropdownMenuItem(value: 'हिंदी', child: Text('हिंदी')), // Hindi
            DropdownMenuItem(value: 'اردو', child: Text('اردو')), // Urdu
          ],
          onChanged: (String? newLanguage) {
            if (newLanguage != null) {
              context.read<LanguageModel>().setLanguage(newLanguage);
            }
          },
        ),
        const SizedBox(width: 10),
        DropdownButton<String>(
          value: context.watch<CurrencyModel>().selectedCurrency ?? 'USD',
          dropdownColor: Colors.grey[800],
          style: const TextStyle(color: Colors.white),
          items: const [
            DropdownMenuItem(value: 'USD', child: Text('USD')),
            DropdownMenuItem(value: 'EUR', child: Text('EUR')),
            DropdownMenuItem(value: 'GBP', child: Text('GBP')),
            DropdownMenuItem(value: 'AUD', child: Text('AUD')),
            DropdownMenuItem(value: 'CAD', child: Text('CAD')),
            DropdownMenuItem(value: 'INR', child: Text('INR')), // Indian Rupee
            DropdownMenuItem(
                value: 'PKR', child: Text('PKR')), // Pakistani Rupee
          ],
          onChanged: (String? newCurrency) {
            if (newCurrency != null) {
              context.read<CurrencyModel>().setCurrency(newCurrency);
            }
          },
        ),
      ],
    );
  }

  Widget _buildProductGrid(String language, String currency) {
    final products = [
      {
        'name': _getProductName(language, 0),
        'description': _getProductDescription(language, 0),
        'image': 'assets/images/images (2).jpg',
        'price': _getProductPrice(currency, 0),
      },
      {
        'name': _getProductName(language, 1),
        'description': _getProductDescription(language, 1),
        'image': 'assets/images/download (1).jpg',
        'price': _getProductPrice(currency, 1),
      },
      {
        'name': _getProductName(language, 2),
        'description': _getProductDescription(language, 2),
        'image': 'assets/images/images (1).jpg',
        'price': _getProductPrice(currency, 2),
      },
      {
        'name': _getProductName(language, 3),
        'description': _getProductDescription(language, 3),
        'image': 'assets/images/images.jpg',
        'price': _getProductPrice(currency, 3),
      },
    ];

    return GridView.builder(
      shrinkWrap:
          true, // Make sure the grid view only takes up as much space as needed
      physics:
          const NeverScrollableScrollPhysics(), // Disable scrolling within the grid view
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing:
            30.0, // Increased spacing between the boxes along the Y-axis
        childAspectRatio: 0.50, // Increased height for the boxes
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(
          product['name']!,
          product['description']!,
          product['price']!,
          product['image']!,
        );
      },
    );
  }

  Widget _buildProductCard(
      String name, String description, String price, String image) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10.0,
      color: Colors.grey[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child:
                Image.asset(image, fit: BoxFit.cover, height: 150, width: 170),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(120, 40),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getProductName(String language, int index) {
    final names = [
      [
        'Cotton T-shirt',
        'Camiseta de Algodón',
        'T-shirt en Coton',
        'Baumwoll-T-Shirt',
        'Maglietta di Cotone',
        'कपास की टी-शर्ट',
        'کاٹن ٹی شرٹ'
      ],
      [
        'Graphic T-shirt',
        'Camiseta Gráfica',
        'T-shirt Graphique',
        'Grafik T-Shirt',
        'T-shirt Grafico',
        'ग्राफिक टी-शर्ट',
        'گرافک ٹی شرٹ'
      ],
      [
        'Hoodie',
        'Sudadera con Capucha',
        'Sweat à Capuche',
        'Kapuzensweatshirt',
        'Felpa con Cappuccio',
        'हुडी',
        'ہوڈی'
      ],
      ['Jacket', 'Chaqueta', 'Veste', 'Jacke', 'Giacca', 'जैकेट', 'جیکٹ'],
    ];
    return names[index][_getLanguageIndex(language)];
  }

  String _getProductDescription(String language, int index) {
    final descriptions = [
      [
        'High-quality t-shirt made from soft cotton.',
        'Camiseta de alta calidad hecha de algodón suave.',
        'T-shirt de haute qualité en coton doux.',
        'Hochwertiges T-Shirt aus weicher Baumwolle.',
        'T-shirt di alta qualità in morbido cotone.',
        'उच्च गुणवत्ता वाली टी-शर्ट नरम कपास से बनी।',
        'اعلی معیار کی ٹی شرٹ نرم کاٹن سے بنی ہے۔'
      ],
      [
        'T-shirt with a cool graphic design.',
        'Camiseta con un diseño gráfico genial.',
        'T-shirt avec un design graphique cool.',
        'T-Shirt mit coolem Grafikdesign.',
        'T-shirt con un design grafico fantastico.',
        'एक कूल ग्राफिक डिज़ाइन वाली टी-शर्ट।',
        'ایک ٹھنڈا گرافک ڈیزائن والی ٹی شرٹ۔'
      ],
      [
        'Comfortable hoodie perfect for cool weather.',
        'Sudadera cómoda, perfecta para el clima fresco.',
        'Sweat à capuche confortable, parfait pour le temps frais.',
        'Bequemes Kapuzensweatshirt, perfekt für kühles Wetter.',
        'Felpa com cappuccio comoda, perfetta per il clima fresco.',
        'ठंडे मौसम के लिए आदर्श आरामदायक हुडी।',
        'ٹھنڈی موسم کے لئے مثالی آرام دہ ہوڈی۔'
      ],
      [
        'Warm jacket for colder weather.',
        'Chaqueta cálida para climas fríos.',
        'Veste chaude pour temps froid.',
        'Warme Jacke für kaltes Wetter.',
        'Giacca calda per il freddo.',
        'ठंडे मौसम के लिए गर्म जैकेट।',
        'ٹھنڈی موسم کے لیے گرم جیکٹ۔'
      ],
    ];
    return descriptions[index][_getLanguageIndex(language)];
  }

  String _getProductPrice(String currency, int index) {
    final prices = [
      ['\$25.99', '€22.99', '£20.99', '€24.99', '€23.99', '₹1999', '₨3000'],
      ['\$19.99', '€18.99', '£16.99', '€17.99', '€16.99', '₹1499', '₨2500'],
      ['\$39.99', '€35.99', '£30.99', '€33.99', '€32.99', '₹3299', '₨5000'],
      ['\$49.99', '€45.99', '£40.99', '€44.99', '€43.99', '₹4299', '₨6500'],
    ];
    return prices[index][_getCurrencyIndex(currency)];
  }

  int _getLanguageIndex(String language) {
    switch (language) {
      case 'Français':
        return 1;
      case 'Español':
        return 2;
      case 'Deutsch':
        return 3;
      case 'Italiano':
        return 4;
      case 'हिंदी':
        return 5;
      case 'اردو':
        return 6;
      default:
        return 0;
    }
  }

  int _getCurrencyIndex(String currency) {
    switch (currency) {
      case 'EUR':
        return 1;
      case 'GBP':
        return 2;
      case 'AUD':
        return 3;
      case 'CAD':
        return 4;
      case 'INR':
        return 5;
      case 'PKR':
        return 6;
      default:
        return 0;
    }
  }
}

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/CurrencyModel.dart';
import '../model/LanguageModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clothing Store"),
        backgroundColor: Colors.white,
        actions: [
          _buildLanguageAndCurrencyDropdown(context),
        ],
      ),
      body: Consumer2<LanguageModel, CurrencyModel>(
          builder: (context, languageModel, currencyModel, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Sidebar for product details
              Expanded(
                child: _buildProductGrid(languageModel.selectedLanguage,
                    currencyModel.selectedCurrency),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildLanguageAndCurrencyDropdown(BuildContext context) {
    return Row(
      children: [
        // Language Dropdown
        DropdownButton<String>(
          value: context.watch<LanguageModel>().selectedLanguage ?? 'English',
          items: const [
            DropdownMenuItem(value: 'English', child: Text('English')),
            DropdownMenuItem(value: 'Español', child: Text('Español')),
            DropdownMenuItem(value: 'Français', child: Text('Français')),
            DropdownMenuItem(value: 'Deutsch', child: Text('Deutsch')),
            DropdownMenuItem(value: 'Italiano', child: Text('Italiano')),
            DropdownMenuItem(value: 'हिन्दी', child: Text('हिन्दी')),
            DropdownMenuItem(value: 'اردو', child: Text('اردو')),
            DropdownMenuItem(value: 'العربية', child: Text('العربية')),
            DropdownMenuItem(value: '中文', child: Text('中文')),
            DropdownMenuItem(value: 'Русский', child: Text('Русский')),
            DropdownMenuItem(value: '한국어', child: Text('한국어')),
            DropdownMenuItem(value: '日本語', child: Text('日本語')),
            DropdownMenuItem(value: 'Português', child: Text('Português')),
            DropdownMenuItem(value: 'Türkçe', child: Text('Türkçe')),
            DropdownMenuItem(value: 'فارسی', child: Text('فارسی')),
            DropdownMenuItem(value: 'Italiano', child: Text('Italiano')),
            DropdownMenuItem(value: 'Tiếng Việt', child: Text('Tiếng Việt')),
            DropdownMenuItem(value: 'Polski', child: Text('Polski')),
            DropdownMenuItem(value: 'Nederlands', child: Text('Nederlands')),
          ],
          onChanged: (String? newLanguage) {
            if (newLanguage != null) {
              context.read<LanguageModel>().setLanguage(newLanguage);
            }
          },
        ),
        const SizedBox(width: 10),
        // Currency Dropdown
        DropdownButton<String>(
          value: context.watch<CurrencyModel>().selectedCurrency ?? 'USD',
          items: const [
            DropdownMenuItem(value: 'USD', child: Text('USD')),
            DropdownMenuItem(value: 'EUR', child: Text('EUR')),
            DropdownMenuItem(value: 'GBP', child: Text('GBP')),
            DropdownMenuItem(value: 'AUD', child: Text('AUD')),
            DropdownMenuItem(value: 'CAD', child: Text('CAD')),
            DropdownMenuItem(value: 'INR', child: Text('INR')),
            DropdownMenuItem(value: 'PKR', child: Text('PKR')),
            DropdownMenuItem(value: 'JPY', child: Text('JPY')),
            DropdownMenuItem(value: 'CNY', child: Text('CNY')),
            DropdownMenuItem(value: 'MXN', child: Text('MXN')),
            DropdownMenuItem(value: 'BRL', child: Text('BRL')),
            DropdownMenuItem(value: 'RUB', child: Text('RUB')),
            DropdownMenuItem(value: 'TRY', child: Text('TRY')),
            DropdownMenuItem(value: 'KRW', child: Text('KRW')),
            DropdownMenuItem(value: 'SGD', child: Text('SGD')),
            DropdownMenuItem(value: 'NZD', child: Text('NZD')),
            DropdownMenuItem(value: 'ZAR', child: Text('ZAR')),
            DropdownMenuItem(value: 'SEK', child: Text('SEK')),
            DropdownMenuItem(value: 'NOK', child: Text('NOK')),
            DropdownMenuItem(value: 'IDR', child: Text('IDR')),
          ],
          onChanged: (String? newCurrency) {
            if (newCurrency != null) {
              context.read<CurrencyModel>().setCurrency(newCurrency);
            }
          },
        ),
      ],
    );
  }

  // Updated method to show products in a grid layout
  Widget _buildProductGrid(String language, String currency) {
    final products = List.generate(20, (index) {
      return {
        'name': _getProductName(language, index),
        'description': _getProductDescription(language, index),
        'image':
            'assets/images/tshirt${index % 4 + 1}.jpg', // Just cycling through 4 images for simplicity
        'price': _getProductPrice(currency, index),
      };
    });

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 16.0, // Space between columns
        mainAxisSpacing: 16.0, // Space between rows
        childAspectRatio:
            0.7, // Adjust the height/width ratio for better spacing
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(
          product['name']!,
          product['description']!,
          product['price']!,
          product['image']!,
        );
      },
    );
  }

  Widget _buildProductCard(
      String name, String description, String price, String image) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10.0,
      color: Colors.grey[900], // Dark background for the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(image,
                fit: BoxFit.cover, height: 150, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                // Action for adding to cart, e.g., navigate to cart page
              },
              child: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 40),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getProductName(String language, int index) {
    final names = [
      // Products
      [
        'Cotton T-shirt',
        'Camiseta de Algodón',
        'T-shirt en Coton',
        'Baumwoll-T-Shirt',
        'Maglietta di Cotone'
      ],
      [
        'Graphic T-shirt',
        'Camiseta Gráfica',
        'T-shirt Graphique',
        'Grafik T-Shirt',
        'T-shirt Grafico'
      ],
      [
        'Hoodie',
        'Sudadera con Capucha',
        'Sweat à Capuche',
        'Kapuzensweatshirt',
        'Felpa con Cappuccio'
      ],
      ['Jacket', 'Chaqueta', 'Veste', 'Jacke', 'Giacca'],
      // Add more products (repeat patterns)
    ];
    return names[index % names.length][_getLanguageIndex(language)];
  }

  String _getProductDescription(String language, int index) {
    final descriptions = [
      // Descriptions for products
      [
        'High-quality t-shirt made from soft cotton.',
        'Camiseta de alta calidad hecha de algodón suave.',
        'T-shirt de haute qualité en coton doux.',
        'Hochwertiges T-Shirt aus weicher Baumwolle.',
        'T-shirt di alta qualità in cotone morbido.'
      ],
      [
        'Stylish graphic design, perfect for casual wear.',
        'Diseño gráfico elegante, perfecto para uso casual.',
        'Design graphique élégant, parfait pour une tenue décontractée.',
        'Stylisches grafisches Design, perfekt für Freizeitkleidung.',
        'Design grafico elegante, perfetto per l\'abbigliamento casual.'
      ],
      [
        'Warm and comfortable hoodie for chilly days.',
        'Sudadera cálida y cómoda para días frescos.',
        'Sweat à capuche chaud et confortable pour les journées fraîches.',
        'Warme und bequeme Kapuzenjacke für kalte Tage.',
        'Felpa calda e comoda per giornate fresche.'
      ],
      [
        'Classic jacket with a modern twist.',
        'Chaqueta clásica con un toque moderno.',
        'Veste classique avec une touche moderne.',
        'Klassische Jacke mit modernem Twist.',
        'Giacca classica con un tocco moderno.'
      ],
    ];
    return descriptions[index % descriptions.length]
        [_getLanguageIndex(language)];
  }

  String _getProductPrice(String currency, int index) {
    final prices = [
      19.99,
      24.99,
      39.99,
      59.99,
      // Add more prices as needed
    ];
    return '$currency ${prices[index % prices.length]}';
  }

  int _getLanguageIndex(String language) {
    List<String> availableLanguages = [
      'English',
      'Español',
      'Français',
      'Deutsch',
      'Italiano',
      'हिन्दी',
      'اردو',
      'العربية',
      '中文',
      'Русский',
      '한국어',
      '日本語',
      'Português',
      'Türkçe',
      'فارسی',
      'Tiếng Việt',
      'Polski',
      'Nederlands'
    ];

    return availableLanguages
        .indexOf(language)
        .clamp(0, availableLanguages.length - 1); // Ensures valid index
  }
}

 */
