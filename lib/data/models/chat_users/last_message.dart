import 'dart:convert';

class LastMessage {
  String? text;
  String? senderId;
  String? timestamp;
  String? read;

  LastMessage({this.text,this.senderId ,this.timestamp, this.read});

  factory LastMessage.from(Map<String, dynamic> data) {
    return LastMessage(
      read: data['read'] as String,
      text: data['text'] as String?,
      senderId: data['senderId'] as String? ,
      timestamp: data['timestamp'] as String?,
    );
  }

  Map<String, dynamic> to() {
    return {'text': text, 'senderId':senderId,'timestamp': timestamp, 'read': read};
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LastMessage].
  factory LastMessage.fromJson(String data) {
    return LastMessage.from(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LastMessage] to a JSON string.
  String toJson() => json.encode(to());
}
