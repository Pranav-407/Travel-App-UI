import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 249, 1),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 160, right: 20),
              child: Row(
                children: [
                  Text(
                    "Profile",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: black),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/svg/edit.svg')
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(255, 234, 223, 1)),
              child: SvgPicture.asset('assets/svg/avatar.svg'),
            ),
            const SizedBox(height: 10),
            Text(
              "Leonardo",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Leonardo@gmail.com",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(125, 132, 141, 1),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Reward Points',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: black,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '360',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(13, 110, 253, 1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Travel Trips',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: black,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '278',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(13, 110, 253, 1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Bucket List',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: black,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '473',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(13, 110, 253, 1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            )),
                        child: RowItem(
                          logo: 'bookmark',
                          title: 'Bookmarked',
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: RowItem(
                          logo: 'plane',
                          title: 'Previous Trips',
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: RowItem(
                          logo: 'settings',
                          title: 'Settings',
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            )),
                        child: RowItem(
                          logo: 'version',
                          title: 'Version',
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Color.fromRGBO(247, 247, 249, 1),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 170,
            )
          ],
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String logo;
  final String title;
  const RowItem({super.key, required this.logo, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/$logo.svg'),
          SizedBox(
            width: 14,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: black,
            ),
          ),
          Spacer(),
          SvgPicture.asset('assets/svg/forward.svg'),
        ],
      ),
    );
  }
}
