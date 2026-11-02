import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() => runApp(const CineApp());

class CineApp extends StatelessWidget {
  const CineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF1F4E79),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
