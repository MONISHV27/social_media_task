import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/services/failure_result.dart';
import 'package:social_media/core/services/like_service_manager.dart';
import 'package:social_media/features/posts/data/repositories/post_like_repository.dart';

class PostLikeRepositoryImpl implements PostLikeRepository {
  final LikeServiceManager service;
  const PostLikeRepositoryImpl({required this.service});
  @override
  Future<Either<FailureResult, String>> likePost({
    required String postId,
    required String userId,
  }) async {
    try {
      final String id = await service.updateLikePost(
        postId: postId,
        userId: userId,
      );
      return Right(id);
    } catch (e) {
      return Left(ResponseFailed());
    }
  }

  @override
  Future<Either<FailureResult, bool>> unLikePost({
    required String likeId,
    required String postId,
  }) async {
    try {
      await service.deletePostLike(postId: postId, likeId: likeId);
      return Right(true);
    } catch (e) {
      return Left(ResponseFailed());
    }
  }
}
