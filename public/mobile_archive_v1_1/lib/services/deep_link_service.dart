import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter/foundation.dart';

class DeepLinkService {
  /// 🌍 The 2026 'Deferred' Invite Logic
  /// This creates a link that survives the App Store install process.
  Future<String> createLoungeInvite({
    required String groupId,
    required String loungeName,
  }) async {
    // 🎨 The Link Aesthetic: Clean, branded, and exclusive.
    BranchUniversalObject buo = BranchUniversalObject(
      canonicalIdentifier: 'lounge/\$groupId',
      title: 'Invite: \$loungeName',
      contentDescription: 'Join our private Nexus Lounge for the upcoming retreat.',
      imageUrl: 'https://nexusconcierge.com/logo_gold.png',
      keywords: ['nexus', 'luxury', 'concierge', 'travel'],
      publiclyIndex: false, // Maintain exclusivity
      locallyIndex: true,
    );

    BranchLinkProperties lp = BranchLinkProperties(
      channel: 'imessage',
      feature: 'invite',
      stage: 'new_member',
    );
    
    // Hardcoding the metadata Nova needs to handle the logic post-install
    lp.addControlParam('groupId', groupId);
    lp.addControlParam('\$desktop_url', 'https://nexusconcierge.com');
    lp.addControlParam('\$ios_url', 'https://nexusconcierge.com/download');

    try {
      BranchResponse response = await FlutterBranchSdk.getShortUrl(buo: buo, linkProperties: lp);
      if (response.success) {
        return response.result;
      } else {
        throw Exception("Failed to generate Secure Link: \${response.errorMessage}");
      }
    } catch (e) {
      debugPrint("Deep Link Failure: \$e");
      return "https://nexus.app/join/\$groupId"; // Safe fallback
    }
  }

  /// 🤝 The 'Handshake' Logic
  /// Listens for incoming invites when the app opens or is installed.
  void initDeepLinkListener(Function(String groupId) onLoungeInviteFound) {
    FlutterBranchSdk.listSession().listen((data) {
      if (data.containsKey('+clicked_branch_link') && data['+clicked_branch_link'] == true) {
        final String? groupId = data['groupId'];
        if (groupId != null) {
          debugPrint("Handshake Verified: Joining Lounge \$groupId");
          onLoungeInviteFound(groupId);
        }
      }
    }, onError: (error) {
      debugPrint("Deep Link Session Error: \$error");
    });
  }
}
