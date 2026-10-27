abstract class LikeServiceManager {
  Future<String> updateLikePost({
    required String postId,
    required String userId,
  });

  Future<void> deletePostLike({required String likeId, required String postId});
}
