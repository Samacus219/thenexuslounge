import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/theme/nexus_theme.dart';
import 'package:mobile/models/safe_zone.dart';
import 'package:mobile/models/lounge_message.dart';
import 'package:mobile/widgets/drop_box.dart';
import 'package:mobile/widgets/result_card.dart';
import 'package:mobile/widgets/social_lounge.dart';
import 'package:mobile/widgets/secure_vault.dart';
import 'package:mobile/screens/profile/elite_profile.dart';

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

  final List<LoungeMessage> _messages = [
    LoungeMessage(id: '1', senderName: 'ALEXANDER', content: 'The Aman Tokyo looks perfect for the group.', type: MessageType.user, timestamp: DateTime.now()),
    LoungeMessage(id: '2', senderName: 'SARAH', content: 'I agree, the Ginza location is unbeatable.', type: MessageType.guest, timestamp: DateTime.now()),
  ];

  void _handleCommand(String command) async {
    setState(() {
      _isProcessing = true;
      _processingText = "Nova is triaging your request...";
      _results = null;
      _showLounge = false;
    });

    await Future.delayed(const Duration(seconds: 4));

    setState(() {
      _isProcessing = false;
      _results = [
        const ResultOption(id: 'aman_tokyo', title: 'The Aman Tokyo', location: 'GINZA DISTRICT', price: '\$1,250 / night', imageUrl: 'images/aman_tokyo.png', highlights: ['PRIVATE OMAKASE', 'SPA ACCESS']),
        const ResultOption(id: 'park_hyatt', title: 'Park Hyatt New York', location: '57TH STREET', price: '\$1,100 / night', imageUrl: 'images/park_hyatt.png', highlights: ['CENTRAL PARK VIEW']),
      ];
    });
    HapticFeedback.lightImpact();
  }

  void _handleCardToggle(String id) {
    setState(() {
      if (_selectedOptionId == id) {
        _selectedOptionId = null;
      } else {
        _selectedOptionId = id;
        _messages.insert(0, LoungeMessage(id: 'L1', senderName: 'SYSTEM', content: 'ALEXANDER HAS SIGNED FOR THE AMAN TOKYO', type: MessageType.system, timestamp: DateTime.now()));
        
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _messages.insert(0, LoungeMessage(id: 'L2', senderName: 'SYSTEM', content: 'SARAH HAS SIGNED FOR THE AMAN TOKYO', type: MessageType.system, timestamp: DateTime.now()));
            _messages.insert(0, LoungeMessage(id: 'N1', senderName: 'NOVA', content: 'Consensus achieved. The Aman Tokyo is locked for your dates.', type: MessageType.nova, timestamp: DateTime.now()));
            _consensusReached = true;
            HapticFeedback.mediumImpact();
          });
        });
      }
    });
  }

  void _openSecureVault() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const SizedBox(
          height: 700,
          child: SecureVault(totalAmount: 2500.0, memberCount: 4),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NexusTheme.black,
      body: _currentTab == 1 
          ? const EliteProfile() 
          : Container(
              decoration: NexusTheme.cinematicBackground, 
              child: Stack(
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
            ),
      
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 24, left: 60, right: 60, top: 20),
        decoration: const BoxDecoration(
          color: NexusTheme.black,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 40, spreadRadius: 10)],
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

  Widget _buildMap() => Positioned.fill(
    child: Center(
      child: Opacity(
        opacity: 0.12, 
        child: Image.asset(
          'images/map_bg.png', // 🛡️ FLATTENED FOR WEB ROBUSTNESS
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) => Container(color: Colors.black12),
        ),
      ),
    ),
  );

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 48, 32, 24), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => setState(() { _showLounge = false; _results = null; }),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('GUARDIAN PROTOCOL v1.1', style: NexusTheme.eliteTheme.textTheme.labelSmall),
                const SizedBox(height: 12), 
                Text('BANGKOK RAIN', style: NexusTheme.eliteTheme.textTheme.displayMedium),
              ],
            ),
          ),
          IconButton(
            onPressed: () => setState(() => _showLounge = !_showLounge),
            icon: Icon(Icons.forum_outlined, color: _showLounge ? NexusTheme.champagne : Colors.white12),
          ),
        ],
      ),
    );
  }

  Widget _buildSafeZones() => Padding(padding: const EdgeInsets.symmetric(horizontal: 32), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Spacer(), const Text('NEARBY SAFE ZONES', style: TextStyle(color: Colors.white12, letterSpacing: 8, fontSize: 9, fontWeight: FontWeight.bold)), const SizedBox(height: 32), ...bangkokSafeZones.map((zone) => _buildSafeZoneTile(zone)), const SizedBox(height: 100)]));

  Widget _buildAmbientWait() => Center(child: Column(mainAxisSize: MainAxisSize.min, children: [const SizedBox(width: 240, child: LinearProgressIndicator(color: NexusTheme.champagne, minHeight: 0.5, backgroundColor: Colors.white10)), const SizedBox(height: 48), Text(_processingText!.toUpperCase(), style: const TextStyle(color: NexusTheme.champagne, letterSpacing: 4, fontSize: 9, fontWeight: FontWeight.w200))]));

  Widget _buildCarousel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 520, 
          child: PageView.builder(
            itemCount: _results!.length,
            controller: PageController(viewportFraction: 0.85), 
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final option = _results![index];
              return ConciergeResultCard(
                option: option,
                isSelected: _selectedOptionId == option.id,
                onToggleSelection: () => _handleCardToggle(option.id),
              );
            },
          ),
        ),
        const SizedBox(height: 40),
        TextButton(onPressed: () => setState(() => _showLounge = true), child: const Text('VIEW LOUNGE DEBATE', style: TextStyle(color: NexusTheme.champagne, letterSpacing: 4, fontSize: 9, fontWeight: FontWeight.bold))),
      ],
    );
  }

  Widget _buildBottomActions() {
    if (_isProcessing) return const SizedBox.shrink();
    if (_consensusReached && _showLounge) return const SizedBox.shrink();
    return Padding(padding: const EdgeInsets.only(bottom: 24), child: DropBox(onCommandSubmitted: _handleCommand));
  }

  Widget _buildSafeZoneTile(SafeZone zone) => Container(margin: const EdgeInsets.only(bottom: 20), padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24), decoration: NexusTheme.glassDecoration, child: Row(children: [Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: NexusTheme.champagne.withOpacity(0.04), borderRadius: BorderRadius.circular(14)), child: Icon(zone.icon, color: NexusTheme.champagne, size: 24)), const SizedBox(width: 24), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(zone.category, style: const TextStyle(color: NexusTheme.champagne, fontSize: 7, letterSpacing: 4, fontWeight: FontWeight.bold)), const SizedBox(height: 8), Text(zone.title, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w200, letterSpacing: 0.5))])), const Icon(Icons.arrow_forward_ios, color: Colors.white10, size: 12)]));
}
