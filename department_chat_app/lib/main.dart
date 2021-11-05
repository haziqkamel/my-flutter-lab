import 'package:department_chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF128C7E),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
