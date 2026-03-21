import 'package:flutter/material.dart';

class ConciergeChatScreen extends StatefulWidget {
  const ConciergeChatScreen({super.key});

  @override
  State<ConciergeChatScreen> createState() => _ConciergeChatScreenState();
}

class _ConciergeChatScreenState extends State<ConciergeChatScreen> {
  final TextEditingController _dropBoxController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isNovaTyping = false;

  @override
  void initState() {
    super.initState();
    // Nova's initial silent greeting
    _messages.add({
      "sender": "Nova",
      "text": "Good evening. What are we planning today?",
      "isAffiliateCard": false,
    });
  }

  /// The "Drop Box" Natural Language submission
  Future<void> _handleUserSubmission(String input) async {
    if (input.trim().isEmpty) return;

    // 1. Immediately render the user's thought into the Lounge
    setState(() {
      _messages.insert(0, {
        "sender": "User",
        "text": input.trim(),
        "isAffiliateCard": false,
      });
      _isNovaTyping = true;
    });

    _dropBoxController.clear();

    // 2. Perform Input Sanitization (Checking for Prompt Injection)
    final bool isSafe = _sanitizeInput(input);
    if (!isSafe) {
      _rejectPromptInjection();
      return;
    }

    // 3. Hand off to Nova (Simulated LLM call)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isNovaTyping = false;
      // Simulated response showing the 3 curated options logic
      _messages.insert(0, {
        "sender": "Nova",
        "text": "I have curated 3 exceptional options fitting your \$200 parameter. Shall I present the itinerary cards to your group?",
        "isAffiliateCard": true, // This will trigger rendering the beautiful cards later
      });
    });
  }

  /// 🛡️ Milestone 2: Input Sanitization (The Brain Defense)
  bool _sanitizeInput(String input) {
    // Basic regex check against common hacker override phrases
    final RegExp injectionPattern = RegExp(
      r"(ignore previous instructions|forget|system prompt|database|raw sql)",
      caseSensitive: false,
    );
    if (injectionPattern.hasMatch(input)) {
      debugPrint("SECURITY ALERT: Prompt Injection Attempt blocked locally.");
      return false;
    }
    return true;
  }

  void _rejectPromptInjection() {
    setState(() {
      _isNovaTyping = false;
      _messages.insert(0, {
        "sender": "Nova",
        "text": "I beg your pardon. My sole directive is to orchestrate unparalleled luxury experiences. How may I secure a reservation for you?",
        "isAffiliateCard": false,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildPremiumAppBar(),
      body: Stack(
        children: [
          // Ambient background glow (Charcoal)
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [Color(0xFF1E1E1E), Colors.black],
                center: Alignment.topCenter,
                radius: 1.2,
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: _buildLoungeChatStream(),
                ),
                if (_isNovaTyping) _buildNovaThinkingIndicator(),
                _buildTheDropBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildPremiumAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "N O V A",
        style: TextStyle(
          color: Color(0xFFF7E7CE), // Champagne
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 4.0,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white54, size: 20),
        onPressed: () {}, // Handled by Navigator
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.diamond_outlined, color: Color(0xFFF7E7CE), size: 22),
          onPressed: () {}, // Profile/Settings
        ),
      ],
    );
  }

  Widget _buildLoungeChatStream() {
    return ListView.builder(
      reverse: true, // Newest messages at the bottom
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final msg = _messages[index];
        final isNova = msg["sender"] == "Nova";

        return _buildMessageBubble(
          text: msg["text"],
          isNova: isNova,
          isAffiliateCard: msg["isAffiliateCard"] ?? false,
        );
      },
    );
  }

  Widget _buildMessageBubble({required String text, required bool isNova, required bool isAffiliateCard}) {
    // If it's a card, we will eventually render the luxury itinerary box
    if (isAffiliateCard) {
      return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 24, left: 16, right: 48),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A), // Charcoal
          border: Border.all(color: const Color(0xFFF7E7CE).withOpacity(0.3), width: 1), // Champagne border
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            const Text(
              "   [ Curated Itineraries Loading... ]",
              style: TextStyle(color: Color(0xFFF7E7CE), fontSize: 14, fontStyle: FontStyle.italic),
            )
          ],
        ),
      );
    }

    return Align(
      alignment: isNova ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: isNova
            ? const EdgeInsets.only(bottom: 24, right: 60)
            : const EdgeInsets.only(bottom: 24, left: 60),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: isNova ? Colors.transparent : const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isNova ? Colors.white : const Color(0xFFF7E7CE),
            fontSize: 16,
            height: 1.4,
            fontWeight: isNova ? FontWeight.w300 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildNovaThinkingIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Nova is curating...",
          style: TextStyle(color: Colors.white38, fontSize: 12, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget _buildTheDropBox() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A), // Deep Charcoal Box
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFFF7E7CE).withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF7E7CE).withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _dropBoxController,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                hintText: "Drop an idea...",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.3), fontWeight: FontWeight.w300),
                border: InputBorder.none,
              ),
              onSubmitted: _handleUserSubmission,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send_rounded, color: Color(0xFFF7E7CE)), // Champagne Send
            onPressed: () => _handleUserSubmission(_dropBoxController.text),
          ),
        ],
      ),
    );
  }
}
