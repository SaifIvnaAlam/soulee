import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soulee/src/features/feed/domain/models/commet_model.dart';
import 'package:soulee/src/features/feed/domain/models/user_info_model.dart';

class Post {
  final String id;
  final UserInfo user;
  final String? description;
  final List<String>? imageUrls;
  final List<String> tags;
  final DateTime timestamp;
  final List<UserInfo> likedUsers;
  final List<Comment> comments;
  final int shares;
  final bool isBookmarked;

  Post({
    required this.id,
    required this.user,
    this.description,
    this.imageUrls,
    required this.tags,
    required this.timestamp,
    required this.likedUsers,
    required this.comments,
    required this.shares,
    required this.isBookmarked,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Post(
      id: doc.id,
      user: UserInfo.fromMap(data['user']),
      description: data['description'],
      imageUrls:
          data['imageUrls'] != null
              ? List<String>.from(data['imageUrls'])
              : null,
      tags: List<String>.from(data['tags'] ?? []),
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      likedUsers:
          data['likedUsers'] != null
              ? (data['likedUsers'] as List)
                  .map((u) => UserInfo.fromMap(u))
                  .toList()
              : [],
      comments:
          data['comments'] != null
              ? (data['comments'] as List)
                  .map((c) => Comment.fromMap(c))
                  .toList()
              : [],
      shares: data['shares'] ?? 0,
      isBookmarked: data['isBookmarked'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'description': description,
      'imageUrls': imageUrls,
      'tags': tags,
      'timestamp': Timestamp.fromDate(timestamp),
      'likedUsers': likedUsers.map((u) => u.toMap()).toList(),
      'comments': comments.map((c) => c.toMap()).toList(),
      'shares': shares,
      'isBookmarked': isBookmarked,
    };
  }
}
