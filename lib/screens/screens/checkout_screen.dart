import 'package:flutter/material.dart';
import 'package:multi_language_currency_app/screens/screens/payment_success_screen.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  String selectedCard = 'New card';
  String selectedCountry = 'Sri Lanka';
  double totalAmount = 171.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontFamily: 'Jost',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Delivery to',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Main street town hall,',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Sebrestria road, Sri Lanka',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Change address',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 11,
                        color: Color.fromRGBO(201, 197, 46, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment methods',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPaymentButton('PayPal'),
                _buildPaymentButton('Apple Pay'),
                _buildPaymentButton('Google Pay'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'or pay using a credit card',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                _buildCardOption('**** 3245'),
                _buildCardOption('**** 1397'),
                _buildCardOption('New card'),
              ],
            ),
            const SizedBox(height: 20),
            if (selectedCard == 'New card') ...[
              _buildTextField('Card number'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _buildTextField('Expiry date')),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTextField('CVV')),
                ],
              ),
              const SizedBox(height: 10),
              _buildTextField('Cardholder name'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedCountry,
                      items: const [
                        DropdownMenuItem(
                            value: 'Sri Lanka', child: Text('Sri Lanka')),
                        DropdownMenuItem(value: 'India', child: Text('India')),
                        DropdownMenuItem(value: 'USA', child: Text('USA')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value!;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[800],
                        labelText: 'Country or region',
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      dropdownColor: Colors.grey[800],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTextField('ZIP Code')),
                ],
              ),
            ],
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '\$${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
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
                  // Navigate to HomePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentSuccessWidget()),
                  );
                },
                child: const Text(
                  'Pay',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentButton(String label) {
    return Container(
      width: 104,
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Jost',
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildCardOption(String cardName) {
    return RadioListTile(
      value: cardName,
      groupValue: selectedCard,
      onChanged: (value) {
        setState(() {
          selectedCard = value.toString();
        });
      },
      title: Text(
        cardName,
        style: const TextStyle(color: Colors.white),
      ),
      activeColor: const Color.fromRGBO(201, 197, 46, 1),
    );
  }

  Widget _buildTextField(String labelText) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
