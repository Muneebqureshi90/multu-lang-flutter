// import 'package:flutter/material.dart';
//
// class CurrencySelector extends StatelessWidget {
//   const CurrencySelector({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//       child: DropdownButtonFormField<String>(
//         decoration: InputDecoration(
//           labelText: 'Select Currency',
//           labelStyle: const TextStyle(
//             color: Colors.blueAccent,
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: const BorderSide(
//               color: Colors.blueAccent,
//               width: 2.0,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: const BorderSide(
//               color: Colors.blue,
//               width: 2.5,
//             ),
//           ),
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
//         ),
//         items: const [
//           DropdownMenuItem(
//               value: 'USD', child: Text('USD - United States Dollar')),
//           DropdownMenuItem(value: 'EUR', child: Text('EUR - Euro')),
//           DropdownMenuItem(value: 'GBP', child: Text('GBP - British Pound')),
//           DropdownMenuItem(
//               value: 'AUD', child: Text('AUD - Australian Dollar')),
//           DropdownMenuItem(value: 'CAD', child: Text('CAD - Canadian Dollar')),
//           DropdownMenuItem(value: 'JPY', child: Text('JPY - Japanese Yen')),
//           DropdownMenuItem(value: 'CNY', child: Text('CNY - Chinese Yuan')),
//           DropdownMenuItem(value: 'INR', child: Text('INR - Indian Rupee')),
//           DropdownMenuItem(value: 'BRL', child: Text('BRL - Brazilian Real')),
//           DropdownMenuItem(value: 'MXN', child: Text('MXN - Mexican Peso')),
//           DropdownMenuItem(value: 'SGD', child: Text('SGD - Singapore Dollar')),
//           DropdownMenuItem(value: 'HKD', child: Text('HKD - Hong Kong Dollar')),
//           DropdownMenuItem(value: 'CHF', child: Text('CHF - Swiss Franc')),
//           DropdownMenuItem(value: 'SEK', child: Text('SEK - Swedish Krona')),
//           DropdownMenuItem(value: 'NOK', child: Text('NOK - Norwegian Krone')),
//           DropdownMenuItem(value: 'DKK', child: Text('DKK - Danish Krone')),
//           DropdownMenuItem(value: 'KRW', child: Text('KRW - South Korean Won')),
//           DropdownMenuItem(
//               value: 'ZAR', child: Text('ZAR - South African Rand')),
//           DropdownMenuItem(value: 'TRY', child: Text('TRY - Turkish Lira')),
//           DropdownMenuItem(value: 'RUB', child: Text('RUB - Russian Ruble')),
//           DropdownMenuItem(value: 'SAR', child: Text('SAR - Saudi Riyal')),
//           DropdownMenuItem(
//               value: 'AED', child: Text('AED - United Arab Emirates Dirham')),
//           DropdownMenuItem(
//               value: 'MYR', child: Text('MYR - Malaysian Ringgit')),
//           DropdownMenuItem(value: 'THB', child: Text('THB - Thai Baht')),
//           DropdownMenuItem(value: 'PLN', child: Text('PLN - Polish Zloty')),
//           DropdownMenuItem(value: 'HUF', child: Text('HUF - Hungarian Forint')),
//           DropdownMenuItem(
//               value: 'IDR', child: Text('IDR - Indonesian Rupiah')),
//           DropdownMenuItem(value: 'PHP', child: Text('PHP - Philippine Peso')),
//           DropdownMenuItem(value: 'VND', child: Text('VND - Vietnamese Dong')),
//           DropdownMenuItem(value: 'EGP', child: Text('EGP - Egyptian Pound')),
//           DropdownMenuItem(value: 'CZK', child: Text('CZK - Czech Koruna')),
//           DropdownMenuItem(value: 'CLP', child: Text('CLP - Chilean Peso')),
//           DropdownMenuItem(value: 'COP', child: Text('COP - Colombian Peso')),
//           DropdownMenuItem(value: 'BHD', child: Text('BHD - Bahraini Dinar')),
//           DropdownMenuItem(value: 'KWD', child: Text('KWD - Kuwaiti Dinar')),
//           DropdownMenuItem(value: 'OMR', child: Text('OMR - Omani Rial')),
//           DropdownMenuItem(value: 'QAR', child: Text('QAR - Qatari Rial')),
//           DropdownMenuItem(
//               value: 'KZT', child: Text('KZT - Kazakhstani Tenge')),
//           DropdownMenuItem(value: 'PKR', child: Text('PKR - Pakistani Rupee')),
//           DropdownMenuItem(value: 'KES', child: Text('KES - Kenyan Shilling')),
//           DropdownMenuItem(value: 'BDT', child: Text('BDT - Bangladeshi Taka')),
//           DropdownMenuItem(value: 'RSD', child: Text('RSD - Serbian Dinar')),
//           DropdownMenuItem(value: 'LKR', child: Text('LKR - Sri Lankan Rupee')),
//           DropdownMenuItem(value: 'GHS', child: Text('GHS - Ghanaian Cedi')),
//           DropdownMenuItem(value: 'MNT', child: Text('MNT - Mongolian Tugrik')),
//           DropdownMenuItem(value: 'ISK', child: Text('ISK - Icelandic Krona')),
//           DropdownMenuItem(value: 'NPR', child: Text('NPR - Nepalese Rupee')),
//           DropdownMenuItem(value: 'JOD', child: Text('JOD - Jordanian Dinar')),
//         ],
//         onChanged: (value) {
//           // Handle currency change
//           print('Selected currency: $value');
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/CurrencyModel.dart';

class CurrencySelector extends StatelessWidget {
  const CurrencySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyModel = Provider.of<CurrencyModel>(context, listen: false);

    return DropdownButton<String>(
      value: currencyModel.selectedCurrency,
      onChanged: (String? newValue) {
        if (newValue != null) {
          currencyModel.setCurrency(newValue);
        }
      },
      items: [
        'USD',
        'EUR',
        'GBP',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
