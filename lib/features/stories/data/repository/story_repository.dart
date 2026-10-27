import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/services/failure_result.dart';
import 'package:social_media/features/stories/data/entities/story_entity.dart';

abstract class StoryRepository {
  Future<Either<FailureResult, List<StoryEntity>>> getStories(String userId);
  Future<Either<FailureResult, StoryEntity>> getStory(
    String userId,
    String storyId,
  );
}
