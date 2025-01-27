import 'package:flutter/material.dart';
import 'package:travel_app/views/onboarding_screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigate(context);
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

  void navigate(BuildContext context){
    Future.delayed(Duration(seconds: 3),() async{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnboardingScreens(),));
    },);
  }
}
