import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:soulee/src/features/feed/domain/models/post_model.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key, required this.post});

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(20),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(post.user.profileImageUrl), radius: 40),
        ),
        title: Text(post.user.name),
      ),
      body: Column(
        children: [
          post.description != null && post.description!.trim().isNotEmpty
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(post.description!, style: const TextStyle(fontSize: 14)),
              )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: post.imageUrls?.length ?? 0,
                itemBuilder: (context, index) {
                  final image = post.imageUrls![index];
                  return CachedNetworkImage(
                    imageUrl: image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.broken_image),
                  );
                },
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
