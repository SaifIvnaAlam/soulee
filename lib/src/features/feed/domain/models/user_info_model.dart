class UserInfo {
  final String name;
  final String profileImageUrl;
  final String uid;

  UserInfo({
    required this.name,
    required this.profileImageUrl,
    required this.uid,
  });

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profileImageUrl': profileImageUrl,
      'uid': uid,
    };
  }
}
