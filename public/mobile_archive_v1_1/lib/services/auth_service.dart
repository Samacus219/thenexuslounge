import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// APPLE COMPLIANCE:
  /// The Apple App Store strictly requires 'Sign in with Apple' 
  /// if any other social sign-in (like Google) is provided.
  Future<UserCredential?> signInWithApple() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
      final AuthCredential credential = oAuthProvider.credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      debugPrint("Apple Auth Token secured. Transmitting to Vault.");
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      debugPrint("Apple Auth Failed: \$e");
      return null;
    }
  }

  /// GOOGLE SIGN IN:
  /// Essential for Android users and cross-platform flexibility.
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // The user canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      debugPrint("Google Auth Token secured. Transmitting to Vault.");
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      debugPrint("Google Auth Failed: \$e");
      return null;
    }
  }

  /// Secure Sign Out mechanism
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    debugPrint("User successfully severed from the Lounge.");
  }
}
