import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                "Sign up now",
                style: GoogleFonts.poppins(
                  fontSize:26,
                  fontWeight:FontWeight.w600,
                  color:black
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Please fill the details and create account",
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