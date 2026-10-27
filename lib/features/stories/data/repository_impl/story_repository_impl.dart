import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/services/failure_result.dart';
import 'package:social_media/features/stories/data/entities/story_entity.dart';
import 'package:social_media/features/stories/data/repository/story_repository.dart';
import 'package:social_media/features/stories/data/services/story_service.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryService service;
  const StoryRepositoryImpl({required this.service});
  @override
  Future<Either<FailureResult, List<StoryEntity>>> getStories(
    String userId,
  ) async {
    try {
      return Right(
        (await service.getStories(userId)).map((e) => e.toEntity()).toList(),
      );
    } catch (e) {
      return Left(ResponseFailed());
    }
  }

  @override
  Future<Either<FailureResult, StoryEntity>> getStory(
    String userId,
    String storyId,
  ) async {
    try {
      return Right((await service.getStory(userId, storyId)).toEntity());
    } catch (e) {
      return Left(ResponseFailed());
    }
  }
}
