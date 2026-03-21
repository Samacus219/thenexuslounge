import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/travel_service.dart';

/// 1. The Active Deals Stream (The Pulse)
/// Listens to the specific group's active deals. When a user taps 'Add Signature',
/// the Firestore array updates, and Riverpod instantly rebuilds the UI globally.
final activeDealsProvider = StreamProvider.family<List<Map<String, dynamic>>, String>((ref, groupId) {
  return FirebaseFirestore.instance
      .collection('groups')
      .doc(groupId)
      .collection('active_deals')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
});

/// 2. The User Presence Stream (The Champagne Dot)
/// Tracks if users in a specific group are currently viewing the Lounge.
final loungePresenceProvider = StreamProvider.family<List<String>, String>((ref, groupId) {
  return FirebaseFirestore.instance
      .collection('groups')
      .doc(groupId)
      .collection('presence')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .where((doc) => doc.data()['is_online'] == true)
          .map((doc) => doc.id)
          .toList());
});

/// 3. The Lounge State Controller
/// Handles the business logic: adding signatures, detecting consensus,
/// and triggering Nova's automated responses.
class LoungeController extends StateNotifier<AsyncValue<void>> {
  final String groupId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  LoungeController(this.groupId) : super(const AsyncData(null));

  /// User taps 'Approve Selection' on an Affiliate Card
  Future<void> addSignatureToDeal(String dealId, String userId) async {
    try {
      final dealRef = _firestore
          .collection('groups')
          .doc(groupId)
          .collection('active_deals')
          .doc(dealId);

      // Add the signature using an array union to avoid race conditions
      await dealRef.update({
        'signatures': FieldValue.arrayUnion([userId])
      });

      // PM Rule Check: Check if consensus is reached
      _checkConsensusAndTriggerNova(dealId);

    } catch (e) {
      state = AsyncError("Signature could not be applied: \$e", StackTrace.current);
    }
  }

  /// 🛡️ The 'Point of No Return' Logic
  Future<void> _checkConsensusAndTriggerNova(String dealId) async {
    final dealSnapshot = await _firestore
        .collection('groups')
        .doc(groupId)
        .collection('active_deals')
        .doc(dealId)
        .get();

    final groupSnapshot = await _firestore.collection('groups').doc(groupId).get();

    final List<dynamic> signatures = dealSnapshot.data()?['signatures'] ?? [];
    final List<dynamic> totalMembers = groupSnapshot.data()?['participant_ids'] ?? [];

    // The Magic Threshold: If majority signs, lock it in.
    if (signatures.length >= (totalMembers.length / 2).ceil()) {
      _triggerNovaConsensusMessage(dealSnapshot.data()?['title'] ?? 'The Selection');
      _transformButtonState(dealId);
    }
  }

  Future<void> _triggerNovaConsensusMessage(String tripName) async {
    // Inject Nova's message into the chat stream instantly
    await _firestore
        .collection('groups')
        .doc(groupId)
        .collection('lounge_messages')
        .add({
      'sender': 'Nova',
      'text': 'The group has reached a consensus. I am now preparing the secure payment portal for \$tripName.',
      'timestamp': FieldValue.serverTimestamp(),
      'isAffiliateCard': false,
    });
  }

  Future<void> _transformButtonState(String dealId) async {
    // Mutate the specific deal to switch UI out of "Voting Phase" into "Payment Phase"
    await _firestore
        .collection('groups')
        .doc(groupId)
        .collection('active_deals')
        .doc(dealId)
        .update({'status': 'locked_for_payment'});
  }
}

final loungeControllerProvider = StateNotifierProvider.family<LoungeController, AsyncValue<void>, String>((ref, groupId) {
  return LoungeController(groupId);
});
