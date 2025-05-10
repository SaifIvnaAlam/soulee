import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soulee/src/features/feed/domain/models/user_info_model.dart';

class Comment {
  final String content;
  final UserInfo user;
  final DateTime timestamp;

  Comment({
    required this.content,
    required this.user,
    required this.timestamp,
  });

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      content: map['content'] ?? '',
      user: UserInfo.fromMap(map['user']),
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'user': user.toMap(),
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
