import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/core/services/comment_service_manegr.dart';
import 'package:social_media/features/posts/data/models/comment_model.dart';
import 'package:social_media/features/posts/data/models/comment_param_model.dart';

class StoryCommentService implements CommentServiceManager {
  const StoryCommentService();
  @override
  Future<CommmentModel> updateComment(CommentParamModel commentParams) async {
    final commentCollectionRef = await FirebaseFirestore.instance
        .collection('stories')
        .doc(commentParams.postId)
        .collection('comments')
        .add({
          'comment': commentParams.comment,
          'commented_by': commentParams.userName,
        });

    return CommmentModel.fromJson(
      (await commentCollectionRef.get()).data() ?? {},
    );
  }
}
