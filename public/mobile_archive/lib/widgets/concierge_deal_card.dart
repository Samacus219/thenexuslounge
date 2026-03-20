import 'dart:ui';
import 'package:flutter/material.dart';
// Note: Requires "url_launcher" package
// import 'package:url_launcher/url_launcher.dart';
import '../services/travel_service.dart';

class ConciergeDealCard extends StatelessWidget {
  final ConciergeDeal deal;
  final bool isTopPick;

  const ConciergeDealCard({
    super.key,
    required this.deal,
    this.isTopPick = false,
  });

  /// 🛡️ PM Strategic Fix: The Affiliate Redirect (In-App SFSafariViewController)
  Future<void> _secureReservation(BuildContext context) async {
    /*
    final Uri url = Uri.parse(deal.affiliateLink);
    if (!await launchUrl(
      url,
      // Forces the luxury In-App WebView instead of bouncing them to Chrome/Safari
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: true,
        enableDomStorage: true,
      ),
    )) {
      debugPrint("Failed to load Secure Reservation link.");
    }
    */
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Launching secure SFSafariViewController..."),
        backgroundColor: Color(0xFF1A1A1A),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 🎨 The Visual Architecture: Glassmorphism over the Radial Gradient
    return Container(
      width: MediaQuery.of(context).size.width * 0.75, // Enables horizontal swipe carousel peek
      margin: const EdgeInsets.only(right: 16, bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E).withOpacity(0.6), // Dark, semi-transparent base
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isTopPick
              ? const Color(0xFFF7E7CE) // Champagne glow for Top Pick
              : const Color(0xFFF7E7CE).withOpacity(0.15),
          width: isTopPick ? 1.5 : 1,
        ),
        boxShadow: isTopPick
            ? [
                BoxShadow(
                  color: const Color(0xFFF7E7CE).withOpacity(0.15),
                  blurRadius: 20,
                  spreadRadius: -5,
                )
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Glassmorphism
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 🖼️ The Hero Image
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black26, // Placeholder color for image
                    ),
                    child: Center(
                      child: Text(
                        "[\${deal.imageUrl} loading...]",
                        style: const TextStyle(color: Colors.white38, fontSize: 12),
                      ),
                    ),
                    // child: CachedNetworkImage(imageUrl: deal.imageUrl, fit: BoxFit.cover),
                  ),
                  if (isTopPick)
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFF7E7CE).withOpacity(0.5)),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.diamond_outlined, color: Color(0xFFF7E7CE), size: 14),
                            SizedBox(width: 6),
                            Text(
                              "NOVA'S TOP PICK",
                              style: TextStyle(
                                  color: Color(0xFFF7E7CE),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Typography: Clean, light, luxurious
                    Text(
                      deal.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 12),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          deal.price,
                          style: const TextStyle(
                            color: Color(0xFFF7E7CE), // Champagne Gold
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'PlayfairDisplay', // Elegant Serif
                          ),
                        ),
                        
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color(0xFFF7E7CE), size: 16),
                            const SizedBox(width: 4),
                            Text(
                              deal.rating,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // The Action Button (No generic 'BUY NOW')
                    GestureDetector(
                      onTap: () => _secureReservation(context),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFF7E7CE).withOpacity(0.6)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            "Secure Reservation",
                            style: TextStyle(
                              color: Color(0xFFF7E7CE),
                              fontSize: 14,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
