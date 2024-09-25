import 'package:flutter/material.dart';
import 'package:waterwisen1/home.dart';
import 'package:waterwisen1/calendar_small.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/calculator': (context) => const Calculator()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
