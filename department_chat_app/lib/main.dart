import 'package:camera/camera.dart';
import 'package:department_chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'screens/camera_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
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
