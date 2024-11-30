import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/CurrencyModel.dart';
import 'model/LanguageModel.dart';
import 'screens/login_screen.dart'; // Make sure this path is correct
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
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
      home:
          const LoginScreen(), // Change to HomeScreen if that's the intended starting page
    );
  }
}
