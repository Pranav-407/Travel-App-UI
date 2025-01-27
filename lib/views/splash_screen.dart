import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 110, 253, 1),
      body: Center(
        child: Text(
          "Travenor",
          style: TextStyle(
            fontFamily: 'Geometr415BlkBT',
            fontSize: 34,
            fontWeight: FontWeight.w400,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
