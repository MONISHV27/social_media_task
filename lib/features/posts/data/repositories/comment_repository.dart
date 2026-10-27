import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/services/failure_result.dart';
import 'package:social_media/features/posts/data/entities/comment_entity.dart';
import 'package:social_media/features/posts/data/entities/comment_params_entity.dart';

abstract class CommentRepository {
  Future<Either<FailureResult, CommentEntity>> uploadComment(
    CommentParamsEntity params,
  );
}
