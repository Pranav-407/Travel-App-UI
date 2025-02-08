import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Text(
                "Sign up now",
                style: GoogleFonts.poppins(
                    fontSize: 26, fontWeight: FontWeight.w600, color: black),
              ),
              SizedBox(height: 12),
              Text(
                "Please fill the details and create account",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w400, color: grey),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 247, 249, 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Name',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(125, 132, 141, 1),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 247, 249, 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Email',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(125, 132, 141, 1),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 247, 249, 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextField(
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: 'Enter your Password',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(125, 132, 141, 1),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Color.fromRGBO(125, 132, 141, 1),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password must be 8 character',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(125, 132, 141, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(13, 110, 253, 1),
                  ),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 56,
              ),
              Text(
                "Or connect",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(125, 132, 141, 1),
                ),
              ),
              SizedBox(
                height: 56,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/fb.png'),
                    Image.asset('assets/images/insta.png'),
                    Image.asset('assets/images/x.png'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
