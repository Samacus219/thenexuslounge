import 'package:flutter/material.dart';

class NexusTheme {
  // 🎨 COLORS: NEXUS ELITE PALETTE
  static const Color black = Color(0xFF000000);
  static const Color charcoal = Color(0xFF0A0A0A);
  static const Color champagne = Color(0xFFF7E7CE);
  static const Color gold = Color(0xFFD4AF37);
  static const Color glassWhite = Color(0x08FFFFFF); // 3% Opacity White (True Paper-Thin)
  static const Color accentGold = Color(0xFFF2D1A8);

  // 🛡️ THEME DATA
  static ThemeData get eliteTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: black,
      colorScheme: ColorScheme.fromSeed(
        seedColor: champagne,
        brightness: Brightness.dark,
        primary: champagne,
        secondary: gold,
        surface: charcoal,
      ),
      
      // ✍️ TYPOGRAPHY: MAXIMIZING BREATH
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: champagne,
          fontFamily: 'Serif',
          fontSize: 72,
          fontStyle: FontStyle.italic,
          letterSpacing: -2,
          height: 1.1,
        ),
        displayMedium: TextStyle(
          color: champagne,
          fontSize: 36,
          fontWeight: FontWeight.w200,
          letterSpacing: 4,
          height: 1.4,
        ),
        bodyLarge: TextStyle(
          color: Colors.white70,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          height: 1.8,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          color: champagne,
          fontSize: 10,
          letterSpacing: 6,
          fontWeight: FontWeight.bold,
        ),
      ),

      // 🔘 CARDS & BUTTONS: PAPER-THIN GLASS
      cardTheme: CardThemeData(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: champagne.withOpacity(0.12), width: 0.5), // Precision 0.5px perimeter
        ),
      ),
    );
  }

  // ✨ GLOW EFFECTS: ARCHITECTURAL DEPTH
  static BoxDecoration get champagneGlow => BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: champagne.withOpacity(0.08),
        blurRadius: 60,
        spreadRadius: 4,
      ),
    ],
  );

  static BoxDecoration get glassDecoration => BoxDecoration(
    color: glassWhite,
    borderRadius: BorderRadius.circular(40),
    border: Border.all(color: champagne.withOpacity(0.1), width: 0.5),
  );

  // 🌑 CINEMATIC DEPTH: RADIAL BLOOM
  static BoxDecoration get cinematicBackground => const BoxDecoration(
    gradient: RadialGradient(
      center: Alignment.center,
      radius: 1.2,
      colors: [
        charcoal, // Bloom in center
        black,    // Locked at corners
      ],
      stops: [0.3, 0.9],
    ),
  );
}
