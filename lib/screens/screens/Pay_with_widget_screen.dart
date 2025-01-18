import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class PaywithWidget extends StatelessWidget {
  const PaywithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 23, 23, 1),
      body: Stack(
        children: <Widget>[
          // Status bar (empty container since we're removing elements like time)
          Positioned(
            top: 1,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Status text (removed irrelevant elements)
                  Container(
                    width: 27,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Center(
                      child: Text(
                        '9:41',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Segoe UI',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Profile text centered
                  SizedBox(width: 42.5),
                  Text(
                    'Profile page',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Jost',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 42.5),
                ],
              ),
            ),
          ),
          Positioned(
            top: 105,
            left: 16,
            child: Text(
              'Pay with',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Jost',
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 135,
            left: 16,
            child: Text(
              'payment currency: USD',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Jost',
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          // Payment Methods
          Positioned(
            top: 179,
            left: 20,
            child: Container(
              width: 339,
              height: 60,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 19,
                    left: 76,
                    child: Text(
                      'Credit or debit card',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Jost',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 259,
            left: 20,
            child: Container(
              width: 339,
              height: 41,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 11,
                    left: 76,
                    child: Text(
                      'Paypal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Jost',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 339,
            left: 20,
            child: Container(
              width: 339,
              height: 41.14,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10,
                    left: 76,
                    child: Text(
                      'Apple pay',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Jost',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom line (footer)
          Positioned(
            top: 779,
            left: 0,
            child: Container(
              width: 375,
              height: 34,
              decoration: BoxDecoration(
                color: Color.fromRGBO(23, 23, 23, 1),
              ),
              child: Center(
                child: Container(
                  width: 131,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromRGBO(246, 246, 246, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
