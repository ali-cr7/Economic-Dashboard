import 'package:uuid/uuid.dart';

class Message {
  final String id;
  final String senderId;
  final String text;
  final DateTime timestamp;
  final bool isExpert;
  final String chatRoomId;

  Message({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    required this.isExpert,
    required this.chatRoomId,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    DateTime timestamp;

    final rawTs = json['timestamp'];

    if (rawTs is Map<String, dynamic>) {
      // Check for Firestore Timestamp style
      final seconds = rawTs['_seconds'] as int?;
      final nanos = rawTs['_nanoseconds'] as int?;

      if (seconds != null && nanos != null) {
        timestamp =
            DateTime.fromMillisecondsSinceEpoch(
              seconds * 1000 + (nanos ~/ 1000000),
              isUtc: true,
            ).toLocal();
      } else {
        // rawTs is a map but missing expected fields (possibly empty)
        // fallback: try to see if rawTs has a nested string 'toString'?
        final tsString = rawTs.toString();
        try {
          timestamp = DateTime.parse(tsString);
        } catch (_) {
          // Fallback to current time and maybe log warning here
          timestamp = DateTime.now();
        }
      }
    } else if (rawTs is String && rawTs.isNotEmpty) {
      try {
        timestamp = DateTime.parse(rawTs);
      } catch (_) {
        timestamp = DateTime.now();
      }
    } else {
      // rawTs is null, empty, or unexpected type
      timestamp = DateTime.now();
    }

    final id = (json['id'] as String?) ?? Uuid().v4();
    final senderId = (json['senderId'] as String?) ?? 'unknown';
    final text = (json['text'] as String?) ?? '';
    final chatRoomId = (json['chatRoomId'] as String?) ?? 'unknown_room';

    return Message(
      id: id,
      senderId: senderId,
      text: text,
      timestamp: timestamp,
      isExpert: senderId == 'expert',
      chatRoomId: chatRoomId,
    );
  }

  // factory Message.fromJson(Map<String, dynamic> json) {
  //   // --- TIMESTAMP PARSING (as before) ---
  //   DateTime timestamp;
  //   final rawTs = json['timestamp'];
  //   if (rawTs is Map<String, dynamic>) {
  //     final seconds = rawTs['_seconds'] as int?;
  //     final nanos = rawTs['_nanoseconds'] as int?;
  //     if (seconds != null && nanos != null) {
  //       timestamp =
  //           DateTime.fromMillisecondsSinceEpoch(
  //             seconds * 1000 + (nanos ~/ 1000000),
  //             isUtc: true,
  //           ).toLocal();
  //     } else {
  //       timestamp = DateTime.now();
  //     }
  //   } else if (rawTs is String && rawTs.isNotEmpty) {
  //     timestamp = DateTime.parse(rawTs);
  //   } else {
  //     timestamp = DateTime.now();
  //   }

  //   // --- STRING FIELDS WITH NULL‐CHECKS & DEFAULTS ---
  //   final id = (json['id'] as String?) ?? Uuid().v4();
  //   final senderId = (json['senderId'] as String?) ?? 'unknown';
  //   final text = (json['text'] as String?) ?? '';
  //   final chatRoomId = (json['chatRoomId'] as String?) ?? 'unknown_room';

  //   return Message(
  //     id: id,
  //     senderId: senderId,
  //     text: text,
  //     timestamp: timestamp,
  //     isExpert: senderId == 'expert',
  //     chatRoomId: chatRoomId,
  //   );
  // }

  Map<String, dynamic> toJson() => {
    'id': id,
    'senderId': senderId,
    'text': text,
    'timestamp': timestamp.toIso8601String(),
    'isExpert': isExpert,
    'chatRoomId': chatRoomId,
  };
}
