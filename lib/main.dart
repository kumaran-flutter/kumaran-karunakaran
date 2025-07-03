import 'package:flutter/material.dart';
import 'package:kumaran_k_portfolio/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kumaran K Portfolio',

      home: const HomePage(),
    );
  }
}
