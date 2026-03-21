import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/lounge_provider.dart';
import '../widgets/concierge_deal_card.dart';

class SocialLoungeScreen extends ConsumerStatefulWidget {
  final String groupId;
  const SocialLoungeScreen({super.key, required this.groupId});

  @override
  ConsumerState<SocialLoungeScreen> createState() => _SocialLoungeScreenState();
}

class _SocialLoungeScreenState extends ConsumerState<SocialLoungeScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final activeDeals = ref.watch(activeDealsProvider(widget.groupId));
    final presence = ref.watch(loungePresenceProvider(widget.groupId));
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildLoungeHeader(presence),
      body: Stack(
        children: [
          // Background Depth
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [Color(0xFF1E1E1E), Colors.black],
                center: Alignment.topCenter,
                radius: 1.2,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: _buildChatStream(activeDeals),
              ),
              _buildMessageInput(),
            ],
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildLoungeHeader(AsyncValue<List<String>> presence) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Column(
        children: [
          const Text(
            "The Tokyo Retreat",
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              color: Color(0xFFF7E7CE),
              fontSize: 18,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "14 Days Remaining",
            style: TextStyle(
              color: const Color(0xFFF7E7CE).withOpacity(0.5),
              fontSize: 10,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
      actions: [
        // Presence Indicators
        presence.maybeWhen(
          data: (onlineIds) => Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: onlineIds.take(3).map((id) => _buildPresenceAvatar(id)).toList(),
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildPresenceAvatar(String userId) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xFF2A2A2A),
            child: Icon(Icons.person, size: 14, color: Colors.white54),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0xFFF7E7CE),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatStream(AsyncValue<List<Map<String, dynamic>>> activeDeals) {
    // In a real implementation, we'd combine deal streams with message streams
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      reverse: true,
      children: [
        // 1. Nova's Consensus Message (Conceptual Placement)
        _buildNovaBubble(
          "The group has reached a consensus. I am now preparing the secure payment portal for the Skyline Suite.",
          isConsensus: true,
        ),

        // 2. The Horizontal Deal Carousel (Sync'd via activeDealsProvider)
        SizedBox(
          height: 380,
          child: activeDeals.when(
            data: (deals) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: deals.length,
              itemBuilder: (context, index) {
                final dealData = deals[index];
                final isWinner = dealData['status'] == 'locked_for_payment';
                return Opacity(
                  opacity: (isWinner || deals.every((d) => d['status'] != 'locked_for_payment')) ? 1.0 : 0.4,
                  child: ConciergeDealCard(
                   // deal: ConciergeDeal.fromJson(dealData), // Simplified for brevity
                    deal: null, // Placeholder as ConciergeDeal mapping is handled in widget
                    isTopPick: dealData['is_top_pick'] ?? false,
                  ),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFF7E7CE))),
            error: (e, st) => const SizedBox.shrink(),
          ),
        ),

        // 3. User Group Banter
        _buildUserBubble("I'm in! Let's do Tokyo.", isMe: false),
        _buildUserBubble("This looks incredible. Signing now.", isMe: true),

        // 4. Nova's Initial Curation
        _buildNovaBubble(
          "I have curated three exceptional stays in Tokyo that align with your preference for minimalist design and proximity to the Ginza district.",
        ),
      ].reversed.toList(),
    );
  }

  Widget _buildNovaBubble(String text, {bool isConsensus = false}) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        padding: const EdgeInsets.all(24),
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: const Color(0xFF131313),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFF7E7CE).withOpacity(isConsensus ? 0.4 : 0.1),
            width: 1,
          ),
          boxShadow: isConsensus ? [
            BoxShadow(
              color: const Color(0xFFF7E7CE).withOpacity(0.05),
              blurRadius: 20,
              spreadRadius: 5,
            )
          ] : [],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'PlayfairDisplay',
            color: Colors.white,
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ),
    );
  }

  Widget _buildUserBubble(String text, {required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF1E1E1E) : const Color(0xFF121212),
          borderRadius: BorderRadius.circular(16).copyWith(
            bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(16),
            bottomLeft: isMe ? const Radius.circular(16) : const Radius.circular(0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? const Color(0xFFF7E7CE) : Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF131313),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white10),
                ),
                child: TextField(
                  controller: _messageController,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(
                    hintText: "Message the Lounge...",
                    hintStyle: TextStyle(color: Colors.white24, fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.send_rounded, color: Color(0xFFF7E7CE), size: 28),
          ],
        ),
      ),
    );
  }
}
