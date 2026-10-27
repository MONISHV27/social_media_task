import 'package:flutter/foundation.dart';
import 'package:social_media/features/stories/data/entities/story_entity.dart';
import 'package:social_media/features/stories/data/entities/story_play_entity.dart';
import 'package:social_media/features/stories/data/repository/story_repository.dart';

sealed class StoryAvatarUIState {
  const StoryAvatarUIState();
}

final class AvatarInitialState extends StoryAvatarUIState {}

final class AvatarLoadingState extends StoryAvatarUIState {
  final String id;
  const AvatarLoadingState({required this.id});
}

final class AvatarSuccessState extends StoryAvatarUIState {
  const AvatarSuccessState();
}

final class AvatarFailureState extends StoryAvatarUIState {
  const AvatarFailureState();
}

class StoryViewModel {
  final ValueNotifier<StoryAvatarUIState> _state = ValueNotifier(
    AvatarInitialState(),
  );

  ValueListenable<StoryAvatarUIState> get stateNotifier => _state;

  StoryAvatarUIState get state => _state.value;

  final List<StoryPlayEntity> storyId = const [
    StoryPlayEntity(
      id: "8STiwGb4Erpnza3KPGhv",
      path: 'assets/videos/video_01.mp4',
    ),
    StoryPlayEntity(
      id: "CEKzlGmrje4W6X5RTtyU",
      path: 'assets/videos/video_02.mp4',
    ),
    StoryPlayEntity(
      id: "Gk7a0vHCxecMzS6dm48T",
      path: 'assets/videos/video_03.mp4',
    ),
    StoryPlayEntity(
      id: "MpQR9q5HsxB0PvoGs4Dy",
      path: 'assets/videos/video_04.mp4',
    ),
    StoryPlayEntity(
      id: "qdbpsu4fLycbuFGea1q1",
      path: 'assets/videos/video_05.mp4',
    ),
  ];

  final StoryRepository repository;
  StoryViewModel({required this.repository, required String userId});

  // void getStories(String userId) async {
  //   final result = await repository.getStories(userId);
  //   result.fold(
  //     ifLeft: (failure) {},
  //     ifRight: (data) {
  //       // stories = data;
  //     },
  //   );
  // }

  Future<StoryEntity?> getStory(String userId, String storyId) async {
    StoryEntity? entity;
    _state.value = AvatarLoadingState(id: storyId);
    final result = await repository.getStory(userId, storyId);
    result.fold(
      ifLeft: (failure) {
        _state.value = AvatarInitialState();
      },
      ifRight: (data) {
        entity = data;
        _state.value = AvatarInitialState();
      },
    );
    return entity;
  }
}
