import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/features/posts/data/models/post_model.dart';

class PostService {
  Future<List<PostModel>> getPost(String userId) async {
    final List<PostModel> posts = [];
    final data = await FirebaseFirestore.instance.collection('posts').get();
    for (var doc in data.docs) {
      final Map<String, dynamic> postInfo = {};
      final postDocRec = doc.data();
      postInfo['id'] = doc.id;
      postInfo.addAll(postDocRec);

      final likeCollectionRef = FirebaseFirestore.instance
          .collection('posts')
          .doc(doc.id) // Replace with actual parent doc ID
          .collection('likes');

      final int likeNos = (await likeCollectionRef.count().get()).count ?? 0;
      final likedDocRec = await likeCollectionRef
          .where('liked_by', isEqualTo: userId)
          .limit(1)
          .get();

      final bool isExist = likedDocRec.docs.isNotEmpty;
      postInfo.addAll({
        'like_id': likedDocRec.docs.isNotEmpty
            ? likedDocRec.docs.first.id
            : null,
        'likes': likeNos,
        'isLiked': isExist ? 1 : 0,
      });
      posts.add(PostModel.fromJson(postInfo));
    }
    return posts;
  }
}
