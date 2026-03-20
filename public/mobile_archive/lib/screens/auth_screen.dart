import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Note: Requires "local_auth" package when building
// import 'package:local_auth/local_auth.dart';

class BiometricAuthScreen extends StatefulWidget {
  const BiometricAuthScreen({super.key});

  @override
  State<BiometricAuthScreen> createState() => _BiometricAuthScreenState();
}

class _BiometricAuthScreenState extends State<BiometricAuthScreen> {
  // final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;

  /// Simulating Apple/Google required Biometric flow
  Future<void> _authenticate() async {
    setState(() {
      _isAuthenticating = true;
    });

    try {
      /* 
      // APPLE/GOOGLE COMPLIANCE: 
      // We must check if biometrics are enrolled, and provide a 
      // localized fallback (PIN/Password) if FaceID fails.
      
      final bool authenticated = await auth.authenticate(
        localizedReason: 'Nexus requires FaceID to secure your vault.',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false, // Allows PIN fallback per Apple rules
        ),
      );
      */
      
      // Simulating the 1.5s delay of a FaceID scan
      await Future.delayed(const Duration(milliseconds: 1500));
      debugPrint("Face ID Authenticated successfully.");
      
      // Navigate to the Nexus Lounge (Main App)
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Welcome back. Entering the Lounge."),
          backgroundColor: Color(0xFF1A1A1A), // Charcoal
        ),
      );
      
    } on PlatformException catch (e) {
      debugPrint("Auth Error: \$e");
      // Handle the strict Apple/Google fallback logic here
    } finally {
      if (mounted) {
        setState(() {
          _isAuthenticating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The Nexus Icon
            const Icon(
              Icons.diamond_outlined,
              color: Color(0xFFF7E7CE), // Champagne
              size: 80,
            ),
            
            const SizedBox(height: 48),
            
            Text(
              "N E X U S",
              style: TextStyle(
                color: const Color(0xFFF7E7CE).withOpacity(0.8),
                fontSize: 24,
                fontWeight: FontWeight.w300,
                letterSpacing: 4.0,
              ),
            ),
            
            const SizedBox(height: 60),

            // Subtle, luxurious unlock button
            GestureDetector(
              onTap: _isAuthenticating ? null : _authenticate,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isAuthenticating 
                      ? const Color(0xFF1A1A1A) 
                      : Colors.transparent,
                  border: Border.all(
                    color: _isAuthenticating 
                        ? Colors.transparent 
                        : const Color(0xFFF7E7CE).withOpacity(0.4),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: _isAuthenticating
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Color(0xFFF7E7CE),
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(
                          Icons.face_unlock_outlined, // Native FaceID/Biometrics Icon
                          color: Color(0xFFF7E7CE),
                          size: 32,
                        ),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            Text(
              _isAuthenticating ? "Authenticating..." : "Tap to Unlock",
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
