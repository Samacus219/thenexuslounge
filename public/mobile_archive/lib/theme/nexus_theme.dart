import 'package:flutter/material.dart';

class NexusTheme {
  // 🎨 COLORS: NEXUS ELITE PALETTE
  static const Color black = Color(0xFF000000);
  static const Color charcoal = Color(0xFF0A0A0A);
  static const Color champagne = Color(0xFFF7E7CE);
  static const Color gold = Color(0xFFD4AF37);
  static const Color glassWhite = Color(0x0DFFFFFF); // 5% Opacity White
  static const Color accentGold = Color(0xFFF2D1A8);

  // 🛡️ THEME DATA
  static ThemeData get eliteTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: black,
      colorScheme: const ColorScheme.dark(
        primary: champagne,
        secondary: gold,
        surface: charcoal,
        background: black,
      ),
      
      // ✍️ TYPOGRAPHY
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: champagne,
          fontFamily: 'Serif', // Use a high-contrast serif if available
          fontSize: 64,
          fontStyle: FontStyle.italic,
          letterSpacing: -1,
        ),
        displayMedium: TextStyle(
          color: champagne,
          fontSize: 32,
          fontWeight: FontWeight.w300,
          letterSpacing: 2,
        ),
        bodyLarge: TextStyle(
          color: Colors.white70,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          height: 1.6,
        ),
        labelSmall: TextStyle(
          color: champagne,
          fontSize: 10,
          letterSpacing: 4,
          fontWeight: FontWeight.bold,
        ),
      ),

      // 🔘 CARDS & BUTTONS
      cardTheme: CardTheme(
        color: charcoal,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: glassWhite, width: 1),
        ),
      ),
    );
  }

  // ✨ GLOW EFFECTS
  static BoxDecoration get champagneGlow => BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: champagne.withOpacity(0.15),
        blurRadius: 30,
        spreadRadius: 2,
      ),
    ],
  );

  static BoxDecoration get glassDecoration => BoxDecoration(
    color: glassWhite,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
  );
}
