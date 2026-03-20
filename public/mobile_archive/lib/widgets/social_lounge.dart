import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/theme/nexus_theme.dart';
import 'package:mobile/models/lounge_message.dart';

class SocialLoungeView extends StatelessWidget {
  final List<LoungeMessage> messages;
  final bool isConsensusReached;
  final VoidCallback? onHandshakeStart;

  const SocialLoungeView({
    super.key,
    required this.messages,
    this.isConsensusReached = false,
    this.onHandshakeStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: NexusTheme.black,
        border: Border(top: BorderSide(color: NexusTheme.glassWhite, width: 1)),
      ),
      child: Column(
        children: [
          // 💎 THE LIVE LEDGER (Scrollable Chat Log)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),

          // 💍 THE POINT OF NO RETURN (Consensus Call-to-Action)
          if (isConsensusReached)
            _buildConsensusAction(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(LoungeMessage message) {
    if (message.type == MessageType.nova) {
      return _buildNovaInjection(message);
    }
    if (message.type == MessageType.system) {
      return _buildSystemLedger(message);
    }
    return _buildHumanBubble(message);
  }

  // 🏛️ NOVA INJECTION: Center-aligned, Serif, Ambient Glow
  Widget _buildNovaInjection(LoungeMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: NexusTheme.glassDecoration,
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            children: [
              const Text('NOVA SENTIENT', 
                style: TextStyle(color: NexusTheme.champagne, fontSize: 8, letterSpacing: 4, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text(message.content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Serif', 
                  color: Colors.white, 
                  fontSize: 18, 
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                )),
            ],
          ),
        ),
      ),
    );
  }

  // 📝 SYSTEM LEDGER: Silent, italicized updates
  Widget _buildSystemLedger(LoungeMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Text(message.content.toUpperCase(),
          style: const TextStyle(color: Colors.white24, fontSize: 9, letterSpacing: 2, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // 🗣️ HUMAN BUBBLE: Edge-aligned, modern sans
  Widget _buildHumanBubble(LoungeMessage message) {
    final isMe = message.type == MessageType.user;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(message.senderName, 
            style: const TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 1)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: isMe ? NexusTheme.charcoal : NexusTheme.glassWhite,
              borderRadius: BorderRadius.circular(20).copyWith(
                bottomRight: isMe ? const Radius.circular(4) : const Radius.circular(20),
                bottomLeft: isMe ? const Radius.circular(20) : const Radius.circular(4),
              ),
              border: Border.all(color: isMe ? NexusTheme.champagne.withOpacity(0.1) : Colors.transparent),
            ),
            child: Text(message.content,
              style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w300)),
          ),
        ],
      ),
    );
  }

  // 🥇 THE CONSENSUS ACTION REVEAL
  Widget _buildConsensusAction() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: NexusTheme.charcoal,
        border: Border.all(color: NexusTheme.champagne.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(color: NexusTheme.black.withOpacity(0.5), blurRadius: 40, spreadRadius: 10),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            const Text('CONSENSUS ACHIEVED', 
              style: TextStyle(color: NexusTheme.champagne, letterSpacing: 6, fontSize: 10, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                HapticFeedback.heavyImpact(); // 🌬️ SYNCED HAPTIC
                onHandshakeStart?.call();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: NexusTheme.champagne,
                foregroundColor: NexusTheme.black,
                minimumSize: const Size(double.infinity, 64),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('PROCEED TO SPLIT-PAY', 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 2)),
            ),
          ],
        ),
      ),
    );
  }
}
