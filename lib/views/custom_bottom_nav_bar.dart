import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/views/home_screen.dart';
import 'package:travel_app/views/messages_screen.dart';
import 'package:travel_app/views/profile_screen.dart';
import 'package:travel_app/views/schedule_screen.dart';
import 'package:travel_app/views/search_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ScheduleScreen(),
    const SearchScreen(),
    const MessagesScreen(),
    const ProfileScreen(),
  ];
  
  final List<NavItem> _items = [
    NavItem(icon: 'assets/svg/home.svg', label: 'Home'),
    NavItem(icon: 'assets/svg/calender.svg', label: 'Calendar'),
    NavItem(icon: 'assets/svg/search.svg', label: 'Search'),
    NavItem(icon: 'assets/svg/chat.svg', label: 'Chats'),
    NavItem(icon: 'assets/svg/profile_navbar.svg', label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.elliptical(1100,150)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_items.length, (index) {
                final item = _items[index];
                final isSelected = _selectedIndex == index;
                
                // Special styling for search button
                if (index == 2) {
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          item.icon,
                          color: Colors.white,
                          
                        ),
                      ),
                    ),
                  );
                }
                
                return GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(item.icon,
                      color: isSelected ? Colors.blue : Colors.grey,),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: GoogleFonts.poppins(
                          color: isSelected ? Colors.blue : Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  final String icon;
  final String label;

  NavItem({required this.icon, required this.label});
}