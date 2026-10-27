import 'package:social_media/features/posts/data/entities/comment_entity.dart';

class StoryEntity {
  final String id;
  final int likes;
  final bool isLiked;
  final String? likeId;
  final List<CommentEntity> comments;

  const StoryEntity({
    required this.id,
    required this.likeId,
    required this.likes,
    required this.isLiked,
    required this.comments,
  });
}
