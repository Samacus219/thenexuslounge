import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmbientWaitingPlaceholder extends StatefulWidget {
  const AmbientWaitingPlaceholder({super.key});

  @override
  State<AmbientWaitingPlaceholder> createState() => _AmbientWaitingPlaceholderState();
}

class _AmbientWaitingPlaceholderState extends State<AmbientWaitingPlaceholder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  String _waitingText = "Nova is curating your selection...";

  @override
  void initState() {
    super.initState();

    // 🎨 The Animation Curve: InOutSine 'Breathing' (1500ms)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 0.25, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );

    // 🕒 The > 4 Second Rule: Transition to 'Refining Aesthetic'
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          _waitingText = "Refining the final aesthetic...";
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Text(
            "[ \$_waitingText ]",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFF7E7CE), // Signature Champagne Gold
              fontSize: 13,
              fontFamily: 'PlayfairDisplay',
              fontStyle: FontStyle.italic,
              letterSpacing: 2.5,
            ),
          ),
        ),
      ),
    );
  }
}

/// 💎 The Haptic Finish Utility
/// To be called by the TravelService the millisecond data is returned.
class NexusHaptics {
  static void triggerCurationDelivery() {
    HapticFeedback.lightImpact(); // Physicalizing the digital delivery
  }
}
