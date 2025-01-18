import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Add this import
import 'package:multi_language_currency_app/screens/home_screen.dart';
import 'package:multi_language_currency_app/screens/screens/select_screen.dart';
import 'package:multi_language_currency_app/screens/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'model/CurrencyModel.dart';
import 'model/LanguageModel.dart';
import 'screens/login_screen.dart'; // Ensure this path is correct
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageModel()),
        ChangeNotifierProvider(create: (_) => CurrencyModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi-Language POS',
      theme: ThemeData(primarySwatch: Colors.blue),
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
        Locale('fr', ''), // French
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const MainWidget(), // Update as necessary
      // home: const HomeScreen(), // Update as necessary
    );
  }
}
