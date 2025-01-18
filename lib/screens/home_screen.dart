import 'package:flutter/material.dart';
import 'package:multi_language_currency_app/screens/receipt_screen.dart';
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
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
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
        'basePrice': 10.0, // Base price in USD
      },
      {
        'name': _getProductName(language, 1),
        'description': _getProductDescription(language, 1),
        'image': 'assets/images/download (1).jpg',
        'basePrice': 15.0, // Base price in USD
      },
      {
        'name': _getProductName(language, 2),
        'description': _getProductDescription(language, 2),
        'image': 'assets/images/images (1).jpg',
        'basePrice': 20.0, // Base price in USD
      },
      {
        'name': _getProductName(language, 3),
        'description': _getProductDescription(language, 3),
        'image': 'assets/images/images.jpg',
        'basePrice': 25.0, // Base price in USD
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 0.90,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final price =
            _getProductPrice(currency, product['basePrice']! as double);
        return _buildProductCard(
          context,
          product['name']! as String,
          product['description']! as String,
          price,
          product['image']! as String,
        );
      },
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String name,
    String description,
    String price,
    String image,
  ) {
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
                Image.asset(image, fit: BoxFit.cover, height: 160, width: 280),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29.0),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReceiptScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(190, 40),
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.black,
              ),
              child: const Text('Buy'),
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
        'Comfortable hoodie for all seasons.',
        'Sudadera cómoda para todas las estaciones.',
        'Sweat à capuche confortable pour toutes les saisons.',
        'Bequeme Kapuzenjacke für alle Jahreszeiten.',
        'Felpa comoda per tutte le stagioni.',
        'सभी मौसमों के लिए आरामदायक हुडी।',
        'تمام موسموں کے لیے آرام دہ ہوڈی۔'
      ],
      [
        'Stylish jacket for cold weather.',
        'Chaqueta elegante para clima frío.',
        'Veste élégante pour temps froid.',
        'Stilvolle Jacke für kaltes Wetter.',
        'Giacca elegante per il freddo.',
        'ठंडे मौसम के लिए स्टाइलिश जैकेट।',
        'سرد موسم کے لیے اسٹائلش جیکٹ۔'
      ],
    ];
    return descriptions[index][_getLanguageIndex(language)];
  }

  String _getProductPrice(String currency, double basePrice) {
    final rates = {
      'USD': 1.0,
      'EUR': 0.85,
      'GBP': 0.75,
      'AUD': 1.5,
      'CAD': 1.4,
      'INR': 75.0,
      'PKR': 150.0,
    };

    final exchangeRate = rates[currency] ?? 1.0;
    final convertedPrice = basePrice * exchangeRate;
    return '$currency ${convertedPrice.toStringAsFixed(2)}';
  }

  int _getLanguageIndex(String language) {
    const languages = [
      'English',
      'Français',
      'Español',
      'Deutsch',
      'Italiano',
      'हिंदी',
      'اردو'
    ];
    return languages.indexOf(language);
  }

  int _getCurrencyIndex(String currency) {
    const currencies = ['USD', 'EUR', 'GBP', 'AUD', 'CAD', 'INR', 'PKR'];
    return currencies.indexOf(currency);
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
