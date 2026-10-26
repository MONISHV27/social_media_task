import 'package:cloud_firestore/cloud_firestore.dart';

class PostLikeService {
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
