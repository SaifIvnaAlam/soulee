import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soulee/src/features/feed/domain/interface/i_get_post.dart';
import 'package:soulee/src/features/feed/domain/models/post_model.dart';

class GetPostsService implements IGetPost {
  @override
  Future<List<Post>> getPosts({int limit = 10, DocumentSnapshot? lastDoc}) async {
    try {
      Query query = FirebaseFirestore.instance.collection('posts').orderBy('timestamp', descending: true).limit(limit);

      if (lastDoc != null) {
        query = query.startAfterDocument(lastDoc);
      }

      final snapshot = await query.get();
      return snapshot.docs.map((doc) => Post.fromDocument(doc)).toList();
    } catch (e) {
      print('Error fetching posts: $e');
      return [];
    }
  }
}
