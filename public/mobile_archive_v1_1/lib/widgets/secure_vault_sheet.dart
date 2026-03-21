import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:pay/pay.dart';
import '../providers/lounge_provider.dart';

class SecureVaultSheet extends ConsumerWidget {
  final String groupId;
  final String dealId;
  final double totalAmount;

  const SecureVaultSheet({
    super.key,
    required this.groupId,
    required this.dealId,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeDeals = ref.watch(activeDealsProvider(groupId));
    final double perPerson = totalAmount / 4; // Simplified for Day 1

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF131313),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 💎 1. The Top Bar & Drag Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_outline, color: Color(0xFFF7E7CE), size: 20),
              const SizedBox(width: 12),
              Text(
                "\$${totalAmount.toStringAsFixed(0)} TOTAL",
                style: const TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  color: Color(0xFFF7E7CE),
                  fontSize: 22,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // 💎 2. The Ledger (Total / Group Size)
          _buildLedgerRow("Amount per Member", "\$${perPerson.toStringAsFixed(2)}"),
          const Divider(color: Colors.white10, height: 40),

          // 💎 3. The Status Array (Who has Authorized?)
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "PAYMENT AUTHORIZATION",
              style: TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 1.5),
            ),
          ),
          const SizedBox(height: 20),
          _buildPaymentStatus("You", isPaid: true),
          _buildPaymentStatus("Sarah", isPaid: true),
          _buildPaymentStatus("James", isPaid: false),
          _buildPaymentStatus("Elena", isPaid: false),

          const SizedBox(height: 48),

          // 💎 4. The Action (Apple/Google Pay)
          // Using a high-end placeholder for the One-Tap Biometric button
          GestureDetector(
            onTap: () => _handleVaultAuthorization(context),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: const Color(0xFFF7E7CE),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple, color: Colors.black, size: 24),
                  SizedBox(width: 8),
                  Text(
                    "Authorize with Apple Pay",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Money will only be captured when all members authorize.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white24, fontSize: 11),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLedgerRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w300)),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
      ],
    );
  }

  Widget _buildPaymentStatus(String name, {required bool isPaid}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300)),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isPaid ? const Color(0xFFF7E7CE) : Colors.transparent,
              border: Border.all(
                color: isPaid ? const Color(0xFFF7E7CE) : Colors.white12,
                width: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleVaultAuthorization(BuildContext context) {
    // Biometric/Stripe Auth Flow Simulation
    debugPrint("Triggering Apple Pay Vault Authorization...");
  }
}
