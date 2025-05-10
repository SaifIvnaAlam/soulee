import 'package:soulee/src/features/feed/domain/models/post_model.dart';

abstract class IGetPost {
  Future<List<Post>> getPosts();
}
