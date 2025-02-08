import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/views/login_screen.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  final List<OnboardingItem> items = [
    OnboardingItem(
      title: 'Life is short and the\nworld is wide',
      highlightedWord: 'wide',
      description:
          'At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations.',
      image: 'assets/images/1.png',
      buttonText: 'Get Started',
    ),
    OnboardingItem(
      title: 'It\'s a big world out\nthere, go explore',
      highlightedWord: 'explore',
      description:
          'To get the best of your adventure you just need to leave and go where you like. We are waiting for you.',
      image: 'assets/images/2.png',
      buttonText: 'Next',
    ),
    OnboardingItem(
      title: 'People don\'t take trips,\ntrips take people',
      highlightedWord: 'people',
      description:
          'To get the best of your adventure you just need to leave and go where you like. We are waiting for you.',
      image: 'assets/images/3.png',
      buttonText: 'Next',
    ),
  ];

  void _handleSkip() {
    // Navigate to the last page
    _controller.animateToPage(
      items.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _handleButtonPress() {
    if (isLastPage) {
      // Navigate to main app
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);
    } else {
      // Go to next page
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == items.length - 1;
              });
            },
            itemCount: items.length,
            itemBuilder: (context, index) => OnboardingPage(
              item: items[index],
              controller: _controller,
              isLastPage: isLastPage,
              onButtonPress: _handleButtonPress,
            ),
          ),
          // Skip button
          Positioned(
            right: 20,
            top: 56,
            child: TextButton(
              onPressed: _handleSkip,
              child: Text(
                "Skip",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(202, 234, 255, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String highlightedWord;
  final String description;
  final String image;
  final String buttonText;

  OnboardingItem({
    required this.title,
    required this.highlightedWord,
    required this.description,
    required this.image,
    required this.buttonText,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;
  final PageController controller;
  final bool isLastPage;
  final VoidCallback onButtonPress;

  const OnboardingPage({
    super.key,
    required this.item,
    required this.controller,
    required this.isLastPage,
    required this.onButtonPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Image Section
        Container(
          height: 505,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            image: DecorationImage(
              image: AssetImage(item.image),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 40),

        // Content Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0),
          child: Column(
            children: [
              _buildRichTitle(item.title, item.highlightedWord),
              const SizedBox(height: 30),
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(125, 132, 141, 1),
                ),
              ),
              const SizedBox(height: 35),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 8,
                  activeDotColor: Color.fromRGBO(13, 110, 253, 1),
                  dotColor: Colors.black26,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
              ),
              const SizedBox(height: 50),

              // Main Button
              _buildActionButton(
                item.buttonText,
                onButtonPress,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRichTitle(String title, String highlightedWord) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.aclonica(
          fontSize: 26,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(27, 30, 40, 1),
        ),
        children: title.split(highlightedWord).expand((text) {
          return [
            TextSpan(text: text),
            TextSpan(
              text: highlightedWord,
              style: GoogleFonts.aclonica(
                fontSize: 26,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(255, 112, 41, 1),
              ),
            ),
          ];
        }).toList()..removeLast(),
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: const Color.fromRGBO(13, 110, 253, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}