import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCardDetailsWidget extends StatelessWidget {
  const AddCardDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header section with the profile page title
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 42.5),
                Text(
                  'Profile Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Jost',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(width: 42.5),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Add card details',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Jost',
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 20),

            // Card number section
            Text(
              'Card number',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Jost',
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: '0000 0000 0000 0000',
                hintStyle: TextStyle(color: Color.fromRGBO(197, 197, 197, 1)),
                filled: true,
                fillColor: Color.fromRGBO(23, 23, 23, 1),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Expiration date section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exp date',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Jost',
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '00/00',
                      style: TextStyle(
                        color: Color.fromRGBO(197, 197, 197, 1),
                        fontFamily: 'Jost',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CVV',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Jost',
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '000',
                      style: TextStyle(
                        color: Color.fromRGBO(197, 197, 197, 1),
                        fontFamily: 'Jost',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Set as default payment method
            Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: Color.fromRGBO(201, 197, 46, 1),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      size: 14,
                      color: Color.fromRGBO(201, 197, 46, 1),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Set as your default payment method',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Jost',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Add button
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(246, 246, 246, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Color.fromRGBO(23, 23, 23, 1),
                    fontFamily: 'Jost',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
