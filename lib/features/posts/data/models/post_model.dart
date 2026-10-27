import 'package:social_media/features/posts/data/entities/post_entity.dart';
import 'package:social_media/features/posts/data/models/comment_model.dart';

class PostModel {
  final String id;
  final String name;
  final String? url;
  final int likes;
  final int isLiked;
  final String? likeId;
  final List<CommmentModel> comments;

  const PostModel({
    required this.id,
    required this.name,
    required this.url,
    required this.likes,
    required this.isLiked,
    required this.likeId,
    required this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      name: json['name'],
      url: json['post_image'] as String?,
      likes: json['likes'] as int,
      isLiked: json['isLiked'] as int,
      likeId: json['like_id'] as String?,
      comments: List.from(
        json['comments'] as List? ?? [],
      ).map((e) => CommmentModel.fromJson(e)).toList(),
    );
  }

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      name: name,
      likeId: likeId,
      url: url,
      likes: likes,
      isLiked: isLiked == 1 ? true : false,
      comments: comments.map((e) => e.toEntity()).toList(),
    );
  }
}
