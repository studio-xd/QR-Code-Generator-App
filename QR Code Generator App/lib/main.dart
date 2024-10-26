import 'package:flutter/material.dart';
import 'package:qr_code_generator/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter QR Code Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFFF2F2F2)),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}