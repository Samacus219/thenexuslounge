import 'package:flutter/material.dart';
import 'package:mobile/theme/nexus_theme.dart';
import 'package:mobile/screens/dashboard/guardian_dashboard.dart';

void main() {
  runApp(const NexusMobileBase());
}

class NexusMobileBase extends StatelessWidget {
  const NexusMobileBase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nexus Elite',
      debugShowCheckedModeBanner: false,
      theme: NexusTheme.eliteTheme,
      home: const DesktopVessel(child: GuardianDashboard()), // 🌬️ THE 9:16 VESSEL
    );
  }
}

// 🛡️ THE "9:16 SENTINEL" EMULATOR: RESTORING THE ASPECT RATIO
class DesktopVessel extends StatelessWidget {
  final Widget child;
  const DesktopVessel({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark outer stage
      body: Center(
        child: Container(
          // 💎 THE NATIVE IPHONE 15 PRO DIMENSIONS (430x932)
          width: 430, 
          height: 932,
          constraints: const BoxConstraints(maxHeight: 932),
          decoration: BoxDecoration(
            color: NexusTheme.black,
            borderRadius: BorderRadius.circular(40),
            // 🌚 THE "STAGE GLOW" VIGNETTE
            boxShadow: [
              BoxShadow(
                color: NexusTheme.champagne.withOpacity(0.08),
                blurRadius: 100,
                spreadRadius: 20,
              ),
              const BoxShadow(
                color: Colors.black,
                blurRadius: 50,
                spreadRadius: 0,
              ),
            ],
            border: Border.all(color: Colors.white10, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: child,
          ),
        ),
      ),
    );
  }
}
