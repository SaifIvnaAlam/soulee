import 'package:soulee/src/features/feed/domain/models/commet_model.dart';
import 'package:soulee/src/features/feed/domain/models/post_model.dart';
import 'package:soulee/src/features/feed/domain/models/user_info_model.dart';

final List<Post> dummyPosts = [
  Post(
    id: 'post1',
    user: UserInfo(
      name: 'Beauty of Bangladesh',
      profileImageUrl: 'https://example.com/user1.jpg',
      uid: 'user_001',
    ),
    description:
        'The riverine country of Bangladesh is one of the most densely populated countries in the world.',
    imageUrls: ['https://example.com/images/boat1.jpg'],
    tags: ['Nature', 'Beautiful', 'Forest'],
    timestamp: DateTime.now().subtract(Duration(minutes: 35)),
    likedUsers: [
      UserInfo(
        name: 'Alice',
        profileImageUrl: 'https://example.com/alice.jpg',
        uid: 'u002',
      ),
      UserInfo(
        name: 'Bob',
        profileImageUrl: 'https://example.com/bob.jpg',
        uid: 'u003',
      ),
    ],
    comments: [
      Comment(
        content: 'So beautiful!',
        user: UserInfo(
          name: 'Alice',
          profileImageUrl: 'https://example.com/alice.jpg',
          uid: 'u002',
        ),
        timestamp: DateTime.now().subtract(Duration(minutes: 30)),
      ),
      Comment(
        content: 'I want to visit!',
        user: UserInfo(
          name: 'Bob',
          profileImageUrl: 'https://example.com/bob.jpg',
          uid: 'u003',
        ),
        timestamp: DateTime.now().subtract(Duration(minutes: 28)),
      ),
    ],
    shares: 21,
    isBookmarked: true,
  ),
  Post(
    id: 'post2',
    user: UserInfo(
      name: 'Travel Vibes',
      profileImageUrl: 'https://example.com/user2.jpg',
      uid: 'user_002',
    ),
    description: null,
    imageUrls: ['https://example.com/images/mountain.jpg'],
    tags: ['Adventure', 'Mountain'],
    timestamp: DateTime.now().subtract(Duration(hours: 1)),
    likedUsers: [],
    comments: [],
    shares: 5,
    isBookmarked: false,
  ),
  Post(
    id: 'post3',
    user: UserInfo(
      name: 'Green Planet',
      profileImageUrl: 'https://example.com/user3.jpg',
      uid: 'user_003',
    ),
    description: 'We should preserve our forests for future generations.',
    imageUrls: null,
    tags: ['Environment', 'Forest'],
    timestamp: DateTime.now().subtract(Duration(hours: 3)),
    likedUsers: [
      UserInfo(
        name: 'Charlie',
        profileImageUrl: 'https://example.com/charlie.jpg',
        uid: 'u004',
      ),
    ],
    comments: [],
    shares: 12,
    isBookmarked: false,
  ),
];
