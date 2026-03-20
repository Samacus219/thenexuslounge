import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/theme/nexus_theme.dart';
import 'package:mobile/models/safe_zone.dart';
import 'package:mobile/models/lounge_message.dart';
import 'package:mobile/widgets/drop_box.dart';
import 'package:mobile/widgets/result_card.dart';
import 'package:mobile/widgets/social_lounge.dart';
import 'package:mobile/widgets/secure_vault.dart';
import 'package:mobile/screens/profile/elite_profile.dart'; // 🌬️ ADD PROFILE

class GuardianDashboard extends StatefulWidget {
  const GuardianDashboard({super.key});

  @override
  State<GuardianDashboard> createState() => _GuardianDashboardState();
}

class _GuardianDashboardState extends State<GuardianDashboard> with TickerProviderStateMixin {
  bool _isProcessing = false;
  String? _processingText;
  List<ResultOption>? _results;
  String? _selectedOptionId;
  bool _showLounge = false;
  bool _consensusReached = false;
  int _currentTab = 0; // 0: Guardian, 1: Profile

  // ... (previous logic)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NexusTheme.black,
      body: _currentTab == 1 
          ? const EliteProfile() 
          : Stack(
              children: [
                _buildMap(),
                SafeArea(
                  child: Column(
                    children: [
                      _buildHeader(),
                      Expanded(
                        child: Stack(
                          children: [
                            if (!_isProcessing && _results == null && !_showLounge) _buildSafeZones(),
                            if (_isProcessing) _buildAmbientWait(),
                            if (!_isProcessing && _results != null && !_showLounge) _buildCarousel(),
                            if (_showLounge) SocialLoungeView(
                              messages: _messages, 
                              isConsensusReached: _consensusReached,
                              onHandshakeStart: _openSecureVault,
                            ),
                          ],
                        ),
                      ),
                      _buildBottomActions(),
                    ],
                  ),
                ),
              ],
            ),
      
      // 💎 THE ELITE NAVIGATION (Minimalist)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 24, left: 60, right: 60, top: 20),
        decoration: const BoxDecoration(
          color: NexusTheme.black,
          boxShadow: [BoxShadow(color: Colors.black24, blurRadius: 40, spreadRadius: 10)],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavIcon(Icons.shield_outlined, 0),
              _buildNavIcon(Icons.person_outline, 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    bool isActive = _currentTab == index;
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() => _currentTab = index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isActive ? NexusTheme.glassWhite : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, color: isActive ? NexusTheme.champagne : Colors.white24, size: 24),
      ),
    );
  }

  // ... (previous helper widgets unchanged for brevity)
  
  // (Included _handleCommand, _handleCardToggle, _openSecureVault, _buildHeader, etc. from earlier turns)
}
