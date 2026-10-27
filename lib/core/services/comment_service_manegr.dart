import 'package:social_media/features/posts/data/models/comment_model.dart';
import 'package:social_media/features/posts/data/models/comment_param_model.dart';

abstract class CommentServiceManager {
  Future<CommmentModel> updateComment(CommentParamModel commentParams);
}
