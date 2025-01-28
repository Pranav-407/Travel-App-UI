import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity,),
              Text(
                "Sign in now",
                style: GoogleFonts.poppins(
                  fontSize:26,
                  fontWeight:FontWeight.w600,
                  color:black
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Please sign in to continue our app",
                style: GoogleFonts.poppins(
                  fontSize:16,
                  fontWeight:FontWeight.w400,
                  color:grey
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}