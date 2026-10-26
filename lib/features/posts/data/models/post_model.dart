import 'package:social_media/features/posts/data/entities/post_entity.dart';

class PostModel {
  final String id;
  final String name;
  final String? url;
  final int likes;
  final int isLiked;
  final String? likeId;

  const PostModel({
    required this.id,
    required this.name,
    required this.url,
    required this.likes,
    required this.isLiked,
    required this.likeId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      name: json['name'],
      url: json['post_image'] as String?,
      likes: json['likes'] as int,
      isLiked: json['isLiked'] as int,
      likeId: json['like_id'] as String?,
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
    );
  }
}
