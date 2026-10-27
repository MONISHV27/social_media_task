import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/core/services/like_service_manager.dart';

class PostLikeService implements LikeServiceManager {
  @override
  Future<String> updateLikePost({
    required String postId,
    required String userId,
  }) async {
    final docRef = await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .add({'liked_by': userId});

    return docRef.id;
  }

  @override
  Future<void> deletePostLike({
    required String likeId,
    required String postId,
  }) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(likeId)
        .delete();
  }
}
