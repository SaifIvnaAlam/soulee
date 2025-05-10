import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:soulee/src/features/feed/application/toggle_like_cubit/like_cubit.dart';
import 'package:soulee/src/features/feed/domain/models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;
  final bool isLiked = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: CachedNetworkImageProvider(post.user.profileImageUrl), radius: 28),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.user.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(Icons.group),
                      SizedBox(width: 12),
                      Text(
                        DateFormat('MMM d, yyyy').format(post.timestamp),
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
          const SizedBox(height: 12),
          // Caption
          post.description != null && post.description!.trim().isNotEmpty
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(post.description!, style: const TextStyle(fontSize: 14)),
              )
              : const SizedBox.shrink(),
          // Tags
          Wrap(spacing: 8, children: [for (var tag in post.tags) _buildTag(tag)]),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: post.imageUrls?.length ?? 0,
              itemBuilder: (context, index) {
                final image = post.imageUrls![index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.broken_image),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<LikeCubit>().toggleLike();
                    },
                    child: BlocBuilder<LikeCubit, LikeState>(
                      builder: (context, state) {
                        return state.map(
                          initial: (_) {
                            return _PostAction(icon: Icons.favorite, count: post.likedUsers.length.toString());
                          },
                          liked: (_) {
                            return _PostAction(
                              icon: Icons.favorite,
                              count: "${post.likedUsers.length + 1}",
                              iconColor: Colors.pinkAccent,
                            );
                          },
                          ulicked: (_) {
                            return _PostAction(icon: Icons.favorite, count: post.likedUsers.length.toString());
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  _PostAction(icon: Icons.comment, count: post.comments.length.toString()),
                ],
              ),
              Row(
                children: [
                  _PostAction(icon: Icons.bookmark, count: ''),
                  SizedBox(width: 10),
                  _PostAction(icon: Icons.share, count: '21'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: Colors.redAccent.shade100, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
    );
  }
}

class _PostAction extends StatelessWidget {
  final IconData icon;
  final String count;
  final Color iconColor;

  const _PostAction({required this.icon, required this.count, this.iconColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: count.isNotEmpty ? 20 : 10, vertical: 5),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor),
            const SizedBox(width: 6),
            if (count.isNotEmpty) Text(count, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
