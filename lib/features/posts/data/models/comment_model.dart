import 'package:social_media/features/posts/data/entities/comment_entity.dart';

class CommmentModel {
  final String comment;
  final String commentedBy;

  const CommmentModel({required this.comment, required this.commentedBy});

  factory CommmentModel.fromJson(Map<String, dynamic> json) {
    return CommmentModel(
      comment: json['comment'] as String? ?? '',
      commentedBy: json['commented_by'] as String? ?? '',
    );
  }

  CommentEntity toEntity() {
    return CommentEntity(comment: comment, commentedBy: commentedBy);
  }
}
