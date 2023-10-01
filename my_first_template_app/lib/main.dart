import 'package:flutter/material.dart';
import 'package:my_first_template_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Template app",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
