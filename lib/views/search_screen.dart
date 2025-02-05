import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 249, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 160, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Cancel',
                    style: GoogleFonts.daysOne(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(13, 110, 253, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 42),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    SvgPicture.asset('assets/svg/search.svg'),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: TextField(
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          cursorHeight: 22,
                          cursorColor: Color.fromRGBO(125, 132, 141, 1),
                          decoration: InputDecoration(
                              hintText: "Search Places",
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(125, 132, 141, 1),
                              ),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 24,
                      color: Color.fromRGBO(125, 132, 141, 1),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SvgPicture.asset('assets/svg/Microphone.svg'),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Search Places',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.74,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 124,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  places[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Expanded(
                              child: Text(
                                places[index].name,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/location.svg'),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      places[index].location,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(125, 132, 141, 1),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    '\$${places[index].price}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromRGBO(13, 110, 253, 1),
                                    ),
                                  ),
                                  Text(
                                    '/Person',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(125, 132, 141, 1),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class Place {
  final String name;
  final String location;
  final double price;
  final String imageUrl;

  Place({
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
  });
}

// Add this to your SearchScreen class
final List<Place> places = [
  Place(
    name: 'Niladri Reservoir',
    location: 'Tekergat, Sunamanjanj',
    price: 894,
    imageUrl: 'assets/images/search1.jpeg',
  ),
  Place(
    name: 'Casalas Tirtugas',
    location: 'Av Damero, Mexico',
    price: 894,
    imageUrl: 'assets/images/search2.jpeg',
  ),
  Place(
    name: 'Aonang Villa',
    location: 'Bastola, Islampur',
    price: 761,
    imageUrl: 'assets/images/search3.jpeg',
  ),
  Place(
    name: 'Rangauti Resort',
    location: 'Sylhet, Airport Road',
    price: 857,
    imageUrl: 'assets/images/search4.jpeg',
  ),
];
