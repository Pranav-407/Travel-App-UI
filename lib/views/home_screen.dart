import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:travel_app/views/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 249, 1),
      body: SafeArea(
        child: Column(
          children: [
            ProfileBanner(),
            Title(),
            SizedBox(height: 30),
            BestDestinations(),
            Cards()
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.poppins(
            fontSize: 38,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(46, 50, 62, 1),
          ),
          children: [
            TextSpan(text: "Explore the "),
            TextSpan(
              text: "Beautiful ",
              style: GoogleFonts.poppins(
                fontSize: 38,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(27, 30, 40, 1),
              ),
            ),
            TextSpan(
              text: "world!",
              style: GoogleFonts.poppins(
                fontSize: 38,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(255, 112, 41, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        badgeColor: Color.fromRGBO(255, 112, 41, 1), // Badge color
      ),
      position: badges.BadgePosition.topEnd(top: 11, end: 8),
      badgeContent: SizedBox.shrink(),
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/svg/notification.svg',
          ),
        ),
      ),
    );
  }
}

class BestDestinations extends StatelessWidget {
  const BestDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(
            'Best Destinations',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(27, 30, 40, 1)),
          ),
          Spacer(),
          Text(
            'View All',
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(13, 110, 253, 1)),
          ),
        ],
      ),
    );
  }
}

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  height: 37,
                  width: 37,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 234, 223, 1),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: SvgPicture.asset(
                      'assets/svg/profile.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Leonardo",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          NotificationBadge()
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  static const List bestDestinations = [
    {
      'image': 'assets/images/card1.jpeg',
      'title': 'Niladri Reservoir',
      'location': 'Tekergat, Sunamgnj',
      'locationDetail' : 'Tekergat',
      'details': 'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Have you ever been on holiday to the Greek '
    },
    {
      'image': 'assets/images/card2.jpeg',
      'title': 'Darma Reservoir',
      'location': 'Darma, Kuningan',
      'locationDetail' : 'Darma',
      'details': 'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Have you ever been on holiday to the Greek '
    }
  ];

  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 20),
      child: SizedBox(
        height: 385,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: bestDestinations.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(card: bestDestinations[index])));
              },
              child: Container(
                height: 385,
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Container(
                    height: 356,
                    width: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 286,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              bestDestinations[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 6.0, right: 6, top: 15),
                          child: Row(
                            children: [
                              Text(
                                bestDestinations[index]['title'],
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg/location.svg'),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              bestDestinations[index]['location'],
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(125, 132, 141, 1),
                              ),
                            ),
                            Spacer(),
                            AvatarList()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AvatarList extends StatelessWidget {
  const AvatarList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 80,
      child: Stack(
        clipBehavior: Clip.none, // Allows avatars to overflow correctly
        children: [
          Positioned(
            left: 0,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.blueAccent,
              backgroundImage: AssetImage('assets/images/avatar1.png'),
            ),
          ),
          Positioned(
            left: 16,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.orangeAccent,
              backgroundImage: AssetImage('assets/images/avatar2.png'),
            ),
          ),
          Positioned(
            left: 32,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.greenAccent,
              backgroundImage: AssetImage('assets/images/avatar3.png'),
            ),
          ),
          Positioned(
            left: 50,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromRGBO(229, 244, 255, 1),
              child: Text(
                '+50',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
