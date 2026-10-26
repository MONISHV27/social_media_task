import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/services/failure_result.dart';
import 'package:social_media/features/posts/data/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<FailureResult, List<PostEntity>>> getPosts(String userId);
}
