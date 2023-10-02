import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/screens/chat_room_screen/chat_room.dart';
import 'package:whatsapp_ui_clone/screens/home_screen/home_screen.dart';
import 'package:whatsapp_ui_clone/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatspp ui clone',
      debugShowCheckedModeBanner: false,
      // for setting dark theme
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: backgroundColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
