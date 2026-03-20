import 'package:flutter/material.dart';
import 'package:mobile/theme/nexus_theme.dart';
import 'package:mobile/screens/dashboard/guardian_dashboard.dart';

void main() {
  runApp(const NexusApp());
}

class NexusApp extends StatelessWidget {
  const NexusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexus Concierge',
      theme: NexusTheme.eliteTheme,
      home: const GuardianDashboard(), // Start with the Guardian Protocol
    );
  }
}
