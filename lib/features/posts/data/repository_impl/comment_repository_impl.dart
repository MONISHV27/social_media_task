import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/services/failure_result.dart';
import 'package:social_media/features/posts/data/entities/comment_entity.dart';
import 'package:social_media/features/posts/data/entities/comment_params_entity.dart';
import 'package:social_media/features/posts/data/repositories/comment_repository.dart';
import 'package:social_media/features/posts/data/services/comment_service.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentService service;
  const CommentRepositoryImpl({required this.service});
  @override
  Future<Either<FailureResult, CommentEntity>> uploadComment(
    CommentParamsEntity params,
  ) async {
    try {
      return Right((await service.updateComment(params.toModel())).toEntity());
    } catch (e) {
      return Left(ResponseFailed());
    }
  }
}
