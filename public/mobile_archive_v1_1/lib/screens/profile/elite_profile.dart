import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/theme/nexus_theme.dart';

class EliteProfile extends StatefulWidget {
  const EliteProfile({super.key});

  @override
  State<EliteProfile> createState() => _EliteProfileState();
}

class _EliteProfileState extends State<EliteProfile> with SingleTickerProviderStateMixin {
  late AnimationController _tiltController;
  bool _isDocumentUnlocked = false;

  @override
  void initState() {
    super.initState();
    _tiltController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _tiltController.dispose();
    super.dispose();
  }

  void _unlockDocument() async {
    // 🛡️ SECONDARY BIOMETRIC HANDSHAKE
    HapticFeedback.mediumImpact();
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => _isDocumentUnlocked = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NexusTheme.black,
      body: CustomScrollView(
        slivers: [
          // 💎 THE DIGITAL BLACK CARD (Dynamic Hero)
          SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('YOUR VAULT', style: TextStyle(color: Colors.white24, letterSpacing: 4, fontSize: 10, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 24),
                    _buildEliteCard(),
                    const SizedBox(height: 48),
                    _buildSentinelDocuments(),
                    const SizedBox(height: 48),
                    _buildVibePreferences(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🏛️ THE DIGITAL BLACK CARD (Gyroscopic Shimmer)
  Widget _buildEliteCard() {
    return AnimatedBuilder(
      animation: _tiltController,
      builder: (context, child) {
        return Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                NexusTheme.charcoal,
                NexusTheme.charcoal,
                NexusTheme.champagne.withOpacity(0.05 + (_tiltController.value * 0.05)),
                NexusTheme.charcoal,
              ],
              stops: const [0, 0.4, 0.5, 1],
            ),
            border: Border.all(color: NexusTheme.champagne.withOpacity(0.1), width: 1),
            boxShadow: [
              BoxShadow(color: NexusTheme.champagne.withOpacity(0.05), blurRadius: 40, spreadRadius: -5),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('AMBASSADOR SYNDICATE', style: TextStyle(color: NexusTheme.champagne, letterSpacing: 2, fontSize: 10, fontWeight: FontWeight.bold)),
                    Icon(Icons.nfc, color: NexusTheme.champagne.withOpacity(0.4), size: 20),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ALEXANDER V.', style: TextStyle(fontFamily: 'Serif', color: Colors.white, fontSize: 24, fontStyle: FontStyle.italic)),
                    SizedBox(height: 4),
                    Text('MEMBER SINCE 2024', style: TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 1)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 🛡️ THE SENTINEL DOCUMENTS (Double-Lock)
  Widget _buildSentinelDocuments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SENTINEL ARCHIVE', style: TextStyle(color: Colors.white24, letterSpacing: 4, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildDocumentTile('PASSPORT', Icons.badge_outlined),
            _buildDocumentTile('RESIDENCY', Icons.article_outlined),
            _buildDocumentTile('INSURANCE', Icons.health_and_safety_outlined),
            _buildDocumentTile('VAULT KYB', Icons.account_balance_outlined),
          ],
        ),
      ],
    );
  }

  Widget _buildDocumentTile(String title, IconData icon) {
    return GestureDetector(
      onTap: _unlockDocument,
      child: Container(
        decoration: NexusTheme.glassDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: _isDocumentUnlocked ? NexusTheme.champagne : Colors.white24, size: 28),
            const SizedBox(height: 12),
            Text(title, style: TextStyle(color: _isDocumentUnlocked ? Colors.white : Colors.white24, fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // 🧠 THE VIBE PREFERENCES (Silent Data)
  Widget _buildVibePreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('THE VIBE PROFILE', style: TextStyle(color: Colors.white24, letterSpacing: 4, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        _buildPreferenceTile('AIRLINE SEATING', 'FIRST CLASS AISLE'),
        _buildPreferenceTile('GASTRONOMY', 'MINIMALIST • OMAKASE'),
        _buildPreferenceTile('BASE AESTHETIC', 'ULTRALUXE • MODERN'),
      ],
    );
  }

  Widget _buildPreferenceTile(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: NexusTheme.charcoal,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: NexusTheme.glassWhite, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 1, fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(color: NexusTheme.champagne, fontSize: 12, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
