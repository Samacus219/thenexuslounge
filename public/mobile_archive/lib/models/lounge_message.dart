import 'package:flutter/material.dart';

enum MessageType { user, guest, nova, system }

class LoungeMessage {
  final String id;
  final String senderName;
  final String content;
  final MessageType type;
  final DateTime timestamp;

  const LoungeMessage({
    required this.id,
    required this.senderName,
    required this.content,
    required this.type,
    required this.timestamp,
  });
}
