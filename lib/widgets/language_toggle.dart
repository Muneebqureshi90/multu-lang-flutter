// import 'package:flutter/material.dart';
//
// class LanguageToggle extends StatelessWidget {
//   const LanguageToggle({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildLanguageButton('English', Colors.green),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Español', Colors.red),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Français', Colors.blue),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Deutsch', Colors.orange),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Italiano', Colors.purple),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Português', Colors.yellow),
//           const SizedBox(width: 12),
//           _buildLanguageButton('العربية', Colors.teal),
//           const SizedBox(width: 12),
//           _buildLanguageButton('中文', Colors.pink),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Русский', Colors.brown),
//           const SizedBox(width: 12),
//           _buildLanguageButton('日本語', Colors.indigo),
//           const SizedBox(width: 12),
//           _buildLanguageButton('한국어', Colors.lime),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Türkçe', Colors.cyan),
//           const SizedBox(width: 12),
//           _buildLanguageButton('हिन्दी', Colors.greenAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('বাংলা', Colors.amber),
//           const SizedBox(width: 12),
//           _buildLanguageButton('ગુજરાતી', Colors.deepOrange),
//           const SizedBox(width: 12),
//           _buildLanguageButton('한국어', Colors.purpleAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Polski', Colors.blueAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Nederlands', Colors.tealAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Svenska', Colors.blueGrey),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Français (Canada)', Colors.green),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Italiano (Switzerland)', Colors.brown),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Tiếng Việt', Colors.purple),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Norsk', Colors.cyanAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Română', Colors.orangeAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Dansk', Colors.lightBlueAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Swahili', Colors.deepPurple),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Türkçe', Colors.amberAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Українська', Colors.purpleAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Esperanto', Colors.redAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Latviešu', Colors.green),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Slovenský', Colors.blue),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Hrvatski', Colors.teal),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Melayu', Colors.indigoAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Čeština', Colors.purpleAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Català', Colors.orange),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Euskara', Colors.lightGreen),
//           const SizedBox(width: 12),
//           _buildLanguageButton('فارسی', Colors.pinkAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Bahasa Indonesia', Colors.yellowAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Magyar', Colors.lime),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Filipino', Colors.cyanAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Serbo-Croatian', Colors.blueGrey),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Tagalog', Colors.greenAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('ქართული', Colors.deepPurpleAccent),
//           const SizedBox(width: 12),
//           _buildLanguageButton('Română', Colors.orangeAccent),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLanguageButton(String language, Color color) {
//     return ElevatedButton(
//       onPressed: () {},
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       child: Text(
//         language,
//         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/LanguageModel.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final languageModel = Provider.of<LanguageModel>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLanguageButton(context, languageModel, 'English'),
        _buildLanguageButton(context, languageModel, 'Español'),
        _buildLanguageButton(context, languageModel, 'Français'),
      ],
    );
  }

  Widget _buildLanguageButton(
      BuildContext context, LanguageModel languageModel, String language) {
    return GestureDetector(
      onTap: () => languageModel.setLanguage(language),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          language,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
