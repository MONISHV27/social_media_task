import 'package:social_media/features/posts/data/models/comment_model.dart';
import 'package:social_media/features/stories/data/entities/story_entity.dart';

class StoryModel {
  final String id;
  final int likes;
  final int isLiked;
  final String? likeId;
  final List<CommmentModel> comments;

  const StoryModel({
    required this.id,
    required this.likes,
    required this.isLiked,
    required this.likeId,
    required this.comments,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      likes: json['likes'] as int,
      isLiked: json['isLiked'] as int,
      likeId: json['like_id'] as String?,
      comments: List.from(
        json['comments'] as List? ?? [],
      ).map((e) => CommmentModel.fromJson(e)).toList(),
    );
  }

  StoryEntity toEntity() {
    return StoryEntity(
      id: id,
      likeId: likeId,
      likes: likes,
      isLiked: isLiked == 1 ? true : false,
      comments: comments.map((e) => e.toEntity()).toList(),
    );
  }
}
