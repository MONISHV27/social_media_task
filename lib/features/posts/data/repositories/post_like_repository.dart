import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/services/failure_result.dart';

abstract class PostLikeRepository {
  Future<Either<FailureResult, String>> likePost({
    required String postId,
    required String userId,
  });

  Future<Either<FailureResult, bool>> unLikePost({
    required String likeId,
    required String postId,
  });
}
