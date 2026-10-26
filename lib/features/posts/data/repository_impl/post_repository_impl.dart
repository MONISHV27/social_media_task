import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/services/failure_result.dart';
import 'package:social_media/features/posts/data/entities/post_entity.dart';
import 'package:social_media/features/posts/data/repositories/post_repository.dart';
import 'package:social_media/features/posts/data/services/post_service.dart';

class PostRepositoryImpl implements PostRepository {
  final PostService service;
  const PostRepositoryImpl({required this.service});
  @override
  Future<Either<FailureResult, List<PostEntity>>> getPosts(
    String userId,
  ) async {
    try {
      return Right(
        (await service.getPost(userId)).map((e) => e.toEntity()).toList(),
      );
    } catch (e) {
      return Left(ResponseFailed());
    }
  }
}
