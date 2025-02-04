import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  final Map card;
  const DetailsScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.52,
                child: Image.asset(
                  card['image'],
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
          Positioned(
            top: 56,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:  () => Navigator.of(context).pop(),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(27, 30, 40, 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Details",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(27, 30, 40, 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.bookmark_outline,color: Colors.white,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(80, 32),
                  topRight: Radius.elliptical(80, 32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 45),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card['title'],
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              card['location'],
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(125, 132, 141, 1),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/images/avatar3.png'),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg/location.svg'),
                            const SizedBox(width: 4),
                            Text(
                              card['locationDetail'],
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(125, 132, 141, 1)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg/star.svg'),
                            SizedBox(width: 4),
                            Text(
                              '4.7',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.3,
                              ),
                            ),
                            Text(
                              '(2498)',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(125, 132, 141, 1)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '\$59/',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(13, 110, 253, 1)),
                            ),
                            Text(
                              'Person',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(125, 132, 141, 1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageCard(image: 'assets/images/detail1.jpeg'),
                        ImageCard(image: 'assets/images/detail2.jpeg'),
                        ImageCard(image: 'assets/images/detail3.jpeg'),
                        ImageCard(image: 'assets/images/detail4.jpeg'),
                        ImageCard(image: 'assets/images/detail5.jpeg'),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      "About Destination",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(27, 30, 40, 1),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Have you ever been on holiday to the Greek ETC... Read More",
                      style: GoogleFonts.poppins(
                          letterSpacing: 1.5,
                          height: 1.95,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(125, 132, 141, 1)),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(13, 110, 253, 1),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String image;
  const ImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
