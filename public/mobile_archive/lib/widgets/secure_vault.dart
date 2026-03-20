import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/theme/nexus_theme.dart';

class SecureVault extends StatefulWidget {
  final double totalAmount;
  final int memberCount;

  const SecureVault({
    super.key,
    required this.totalAmount,
    required this.memberCount,
  });

  @override
  State<SecureVault> createState() => _SecureVaultState();
}

class _SecureVaultState extends State<SecureVault> {
  bool _isAuthenticated = false;
  bool _isAuthorized = false;

  @override
  void initState() {
    super.initState();
    // 🛡️ TRIGGER THE BIOMETRIC GATE IMMEDIATELY
    _authenticate();
  }

  Future<void> _authenticate() async {
    await Future.delayed(const Duration(milliseconds: 800)); // Pacing
    // Simulate local_auth call
    setState(() {
      _isAuthenticated = true;
      HapticFeedback.mediumImpact(); // 🌬️ SYNCED HAPTIC (Unlock)
    });
  }

  @override
  Widget build(BuildContext context) {
    final double share = widget.totalAmount / widget.memberCount;

    return Container(
      decoration: const BoxDecoration(
        color: NexusTheme.charcoal,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          // 🥂 THE CHAMPAGNE INDICATOR
          const SizedBox(height: 12),
          Container(height: 4, width: 40, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(2))),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  // 🛡️ THE SENTINEL STATUS
                  Icon(
                    _isAuthenticated ? Icons.lock_open_outlined : Icons.lock_outline,
                    color: _isAuthenticated ? NexusTheme.champagne : Colors.white10,
                    size: 40,
                  ),
                  const SizedBox(height: 24),
                  Text(_isAuthenticated ? 'VAULT ACCESS GRANTED' : 'LOCKING VAULT...',
                    style: TextStyle(color: _isAuthenticated ? NexusTheme.champagne : Colors.white10, letterSpacing: 4, fontSize: 10, fontWeight: FontWeight.bold)),
                  
                  const Spacer(),

                  // 📊 THE MINIMALIST LEDGER (The Math)
                  if (_isAuthenticated) ...[
                    Text('Total: \$${widget.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white24, fontSize: 16, fontWeight: FontWeight.w200, letterSpacing: 1)),
                    const SizedBox(height: 12),
                    Text('Divided by: ${widget.memberCount} Members',
                      style: const TextStyle(color: Colors.white24, fontSize: 14, fontWeight: FontWeight.w200)),
                    const SizedBox(height: 48),
                    const Text('YOUR HOLD', 
                      style: TextStyle(color: NexusTheme.champagne, letterSpacing: 6, fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text('\$${share.toStringAsFixed(2)}',
                      style: const TextStyle(fontFamily: 'Serif', color: Colors.white, fontSize: 64, fontStyle: FontStyle.italic)),
                  ],

                  const Spacer(),

                  // 💍 MULTIPLAYER STATUS RINGS (Silent Pressure)
                  if (_isAuthenticated) ...[
                    const Text('GROUP AUTHORIZATION STATUS', 
                      style: TextStyle(color: Colors.white24, fontSize: 8, letterSpacing: 2, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStatusRing(true), // Me (Authorized)
                        _buildStatusRing(true), // Friend 1
                        _buildStatusRing(false), // Friend 2
                        _buildStatusRing(false), // Friend 3
                      ],
                    ),
                  ],

                  const Spacer(),

                  // 🚀 NATIVE PAY (One Tap)
                  if (_isAuthenticated)
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() => _isAuthorized = true);
                            HapticFeedback.heavyImpact();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            minimumSize: const Size(double.infinity, 64),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.apple, size: 24), // Placeholder for Apple Pay
                              const SizedBox(width: 12),
                              Text(_isAuthorized ? 'HOLD SECURED' : 'AUTHORIZE WITH PAY', 
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text('Vault Protected by AES-256 Encryption',
                          style: TextStyle(color: Colors.white10, fontSize: 10, letterSpacing: 1)),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRing(bool isAuthorized) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isAuthorized ? NexusTheme.champagne : Colors.white10,
          width: 2,
        ),
        boxShadow: isAuthorized ? [
          BoxShadow(color: NexusTheme.champagne.withOpacity(0.3), blurRadius: 10, spreadRadius: 1)
        ] : [],
      ),
      child: Center(
        child: Icon(
          isAuthorized ? Icons.check : Icons.person_outline,
          color: isAuthorized ? NexusTheme.champagne : Colors.white10,
          size: 16,
        ),
      ),
    );
  }
}
