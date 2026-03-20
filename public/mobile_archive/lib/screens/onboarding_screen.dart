import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "N E X U S",
      "subtitle": "The Pre-eminent Social Concierge.",
      "description": "A culture of service, refined for your inner circle."
    },
    {
      "title": "Frictionless Delegation",
      "subtitle": "Drop an idea. We handle the rest.",
      "description": "Simply tell Nova what you desire. From Michelin-starred dining to exclusive villas, we source, curate, and present the finest options."
    },
    {
      "title": "The Silent Nudge",
      "subtitle": "Effortless Group Governance.",
      "description": "Vote on itineraries and let Nova seamlessly manage split payments. No chasing friends for money. Just pure experiences."
    },
    {
      "title": "The Guardian",
      "subtitle": "Uncompromising Security abroad.",
      "description": "Instant access to embassy details, top-tier medical routing, and secure document vaulting wherever you travel."
    }
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Core Aesthetic: Luxury Dark Mode (Black #000000, Champagne #F7E7CE)
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Gradient to give a "Glass" luxury depth
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [Color(0xFF1A1A1A), Colors.black],
                center: Alignment.center,
                radius: 1.5,
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _onboardingData.length,
                    itemBuilder: (context, index) {
                      return _buildPage(
                        title: _onboardingData[index]["title"]!,
                        subtitle: _onboardingData[index]["subtitle"]!,
                        description: _onboardingData[index]["description"]!,
                        isFirstPage: index == 0,
                      );
                    },
                  ),
                ),
                _buildBottomControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String subtitle,
    required String description,
    required bool isFirstPage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isFirstPage) 
            const Center(
              child: Icon(Icons.diamond_outlined, color: Color(0xFFF7E7CE), size: 60),
            )
          else
            const SizedBox(height: 60),

          const SizedBox(height: 40),
          
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFF7E7CE), // Champagne
              fontSize: 32,
              fontWeight: FontWeight.w300,
              letterSpacing: 2.5,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          
          const SizedBox(height: 24),
          
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.6,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dot Indicators
          Row(
            children: List.generate(
              _onboardingData.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(right: 8),
                height: 4,
                width: _currentPage == index ? 24 : 12,
                decoration: BoxDecoration(
                  color: _currentPage == index 
                      ? const Color(0xFFF7E7CE) // Champagne
                      : Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          
          // Action Button
          GestureDetector(
            onTap: () {
              if (_currentPage < _onboardingData.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              } else {
                // TODO: Navigate to Authentication / Biometrics Lounge
                debugPrint("Entering the Lounge...");
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF7E7CE).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(30),
                color: _currentPage == _onboardingData.length - 1 
                    ? const Color(0xFFF7E7CE) 
                    : Colors.transparent,
              ),
              child: Text(
                _currentPage == _onboardingData.length - 1 ? "Enter Lounge" : "Next",
                style: TextStyle(
                  color: _currentPage == _onboardingData.length - 1 
                      ? Colors.black 
                      : const Color(0xFFF7E7CE),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
