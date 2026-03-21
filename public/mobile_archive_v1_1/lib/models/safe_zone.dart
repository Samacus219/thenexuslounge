import 'package:flutter/material.dart';

class SafeZone {
  final String id;
  final String title;
  final String category; // Hospital, Police, Embassy, Vault
  final double lat;
  final double lng;
  final IconData icon;

  const SafeZone({
    required this.id,
    required this.title,
    required this.category,
    required this.lat,
    required this.lng,
    required this.icon,
  });
}

// 🛡️ BANGKOK ELITE MAPPING (INITIAL SCALE)
final List<SafeZone> bangkokSafeZones = [
  const SafeZone(
    id: 'bumrungrad',
    title: 'Bumrungrad International',
    category: 'ELITE HOSPITAL',
    lat: 13.7461,
    lng: 100.5524,
    icon: Icons.local_hospital_outlined,
  ),
  const SafeZone(
    id: 'police',
    title: 'Tourist Police HQ',
    category: 'SECURITY',
    lat: 13.7500,
    lng: 100.5231,
  icon: Icons.shield_outlined,
  ),
  const SafeZone(
    id: 'nexus_vault',
    title: 'Nexus Vault Alpha',
    category: 'THE VAULT',
    lat: 13.7367,
    lng: 100.5830,
    icon: Icons.lock_outline,
  ),
];
