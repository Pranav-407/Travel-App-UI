import 'package:flutter/material.dart';
import 'package:travel_app/views/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Geometr415BlkBT"
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
