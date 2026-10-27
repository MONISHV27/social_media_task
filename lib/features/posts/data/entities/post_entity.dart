import 'package:social_media/features/posts/data/entities/comment_entity.dart';

class PostEntity {
  final String id;
  final String name;
  final String? url;
  final int likes;
  final bool isLiked;
  final String? likeId;
  final List<CommentEntity> comments;

  const PostEntity({
    required this.id,
    required this.likeId,
    required this.name,
    required this.url,
    required this.likes,
    required this.isLiked,
    required this.comments,
  });
}
