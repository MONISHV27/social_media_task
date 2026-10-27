import 'package:social_media/features/posts/data/models/comment_param_model.dart';

class CommentParamsEntity {
  final String comment;
  final String postId;
  final String userName;

  const CommentParamsEntity({
    required this.comment,
    required this.postId,
    required this.userName,
  });

  CommentParamModel toModel() {
    return CommentParamModel(
      userName: userName,
      postId: postId,
      comment: comment,
    );
  }
}
