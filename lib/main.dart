import 'package:agenpulsa/theme/theme_provider.dart';
import 'package:agenpulsa/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const PulsaApp(),
    )
  );
}

class PulsaApp extends StatelessWidget {
  const PulsaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
